package vn.io.datvutech.beatbuddy.api.entity;

import java.io.Serializable;
import java.time.ZonedDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.SourceType;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import lombok.Getter;
import vn.io.datvutech.beatbuddy.api.util.UserContext;

@Getter
@MappedSuperclass
public class AbstractEntity implements Serializable {
    protected String createdBy;

    protected String updatedBy;

    @CreationTimestamp(source = SourceType.DB)
    protected ZonedDateTime createdAt;

    @UpdateTimestamp(source = SourceType.DB)
    protected ZonedDateTime updatedAt;

    @PrePersist
    public void prePersist() {
        String userId = UserContext.getUserId();
        userId = userId == null ? UserContext.ANONYMOUS : userId;

        createdBy = userId;
        updatedBy = userId;
    }

    @PreUpdate
    public void preUpdate() {
        String userId = UserContext.getUserId();
        userId = userId == null ? UserContext.ANONYMOUS : userId;

        updatedBy = userId;
    }
}
