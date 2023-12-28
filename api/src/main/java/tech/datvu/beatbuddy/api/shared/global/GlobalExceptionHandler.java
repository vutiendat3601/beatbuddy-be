package tech.datvu.beatbuddy.api.shared.global;

import static tech.datvu.beatbuddy.api.shared.global.GlobalException.HTTP_STATUS_REGEX;

import java.util.List;

import org.springframework.beans.TypeMismatchException;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.validation.method.ParameterValidationResult;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.HandlerMethodValidationException;

import tech.datvu.beatbuddy.api.shared.models.Response;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public ResponseEntity<Response<?>> handleHttpMediaTypeNotSupportedException(HttpMediaTypeNotSupportedException e) {
        return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body(
                Response.errorGlobal(CommonException.MEDIA_TYPE_NOT_SUPPORTED.instance()));
    }

    @ExceptionHandler(GlobalException.class)
    public ResponseEntity<Response<?>> handleHttpMediaTypeNotSupportedException(GlobalException e) {
        int status = 500;
        String code = e.getCode();
        if (code != null && code.matches(HTTP_STATUS_REGEX)) {
            status = Integer.parseInt(code);
        }
        return ResponseEntity.status(status).body(
                Response.errorGlobal(e));
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    public ResponseEntity<Response<?>> handleMissingServletRequestParameterException(
            MissingServletRequestParameterException e) {
        GlobalException errResp = CommonException.BAD_REQUEST.instance();
        errResp.setMessage(e.getParameterName() + " is missing");
        return ResponseEntity.badRequest().body(
                Response.errorGlobal(errResp));
    }

    @ExceptionHandler(TypeMismatchException.class)
    public ResponseEntity<Response<?>> handleTypeMismatchException(TypeMismatchException e) {
        GlobalException errResp = CommonException.BAD_REQUEST.instance();
        errResp.setMessage(e.getPropertyName() + " is wrong type");
        return ResponseEntity.badRequest().body(
                Response.errorGlobal(errResp));
    }

    @ExceptionHandler(HandlerMethodValidationException.class)
    public ResponseEntity<Response<?>> handleHandlerMethodValidationException(HandlerMethodValidationException e) {
        GlobalException errResp = CommonException.BAD_REQUEST.instance();
        List<ParameterValidationResult> valiationResults = e.getValueResults();
        if (!valiationResults.isEmpty()) {
            MethodParameter param = valiationResults.get(0).getMethodParameter();
            String message = valiationResults.get(0).getResolvableErrors().get(0).getDefaultMessage();
            errResp.setMessage("%s %s".formatted(param.getParameterName(), message));
        }
        return ResponseEntity.badRequest().body(
                Response.errorGlobal(errResp));
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Response<?>> handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        GlobalException errResp = CommonException.BAD_REQUEST.instance();
        FieldError fieldErr = e.getFieldError();
        if (fieldErr != null) {
            String errCode = fieldErr.getCode();
            if (errCode != null) {
                String field = fieldErr.getField();
                switch (errCode) {
                    case "typeMismatch":
                        errResp.setMessage("%s %s".formatted(field, "is wrong type"));
                        break;

                    default:
                        errResp.setMessage("%s %s".formatted(field, fieldErr.getDefaultMessage()));
                }
            }
        }
        return ResponseEntity.badRequest().body(
                Response.errorGlobal(errResp));
    }
}
