package tech.datvu.beatbuddy.api.shared.models;

import java.io.Serializable;
import java.time.ZonedDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.SourceType;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import lombok.Getter;
import tech.datvu.beatbuddy.api.shared.utils.UserContext;

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
        createdBy = UserContext.getUsername();
        updatedBy = UserContext.getUsername();
    }

    @PreUpdate
    public void preUpdate() {
        updatedBy = UserContext.getUsername();
    }
}
