package tech.datvu.beatbuddy.api.entity;

import java.io.Serializable;
import java.time.ZonedDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.SourceType;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import lombok.Getter;
import tech.datvu.beatbuddy.api.util.UserContext;

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
        String username = UserContext.getUsername();
        username = username == null ? UserContext.ANONYMOUS : username;

        createdBy = username;
        updatedBy = username;
    }

    @PreUpdate
    public void preUpdate() {
        String username = UserContext.getUsername();
        username = username == null ? UserContext.ANONYMOUS : username;

        updatedBy = username;
    }
}
