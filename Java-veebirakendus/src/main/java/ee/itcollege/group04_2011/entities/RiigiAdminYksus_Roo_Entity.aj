// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.group04_2011.entities;

import ee.itcollege.group04_2011.entities.RiigiAdminYksus;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RiigiAdminYksus_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager RiigiAdminYksus.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer RiigiAdminYksus.version;
    
    public Integer RiigiAdminYksus.getVersion() {
        return this.version;
    }
    
    public void RiigiAdminYksus.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void RiigiAdminYksus.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void RiigiAdminYksus.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            RiigiAdminYksus attached = RiigiAdminYksus.findRiigiAdminYksus(this.riigiAdminYksusId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void RiigiAdminYksus.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void RiigiAdminYksus.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public RiigiAdminYksus RiigiAdminYksus.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        RiigiAdminYksus merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager RiigiAdminYksus.entityManager() {
        EntityManager em = new RiigiAdminYksus().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long RiigiAdminYksus.countRiigiAdminYksuses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM RiigiAdminYksus o", Long.class).getSingleResult();
    }
    
    public static List<RiigiAdminYksus> RiigiAdminYksus.findAllRiigiAdminYksuses() {
        return entityManager().createQuery("SELECT o FROM RiigiAdminYksus o", RiigiAdminYksus.class).getResultList();
    }
    
    public static RiigiAdminYksus RiigiAdminYksus.findRiigiAdminYksus(Long riigiAdminYksusId) {
        if (riigiAdminYksusId == null) return null;
        return entityManager().find(RiigiAdminYksus.class, riigiAdminYksusId);
    }
    
    public static List<RiigiAdminYksus> RiigiAdminYksus.findRiigiAdminYksusEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM RiigiAdminYksus o", RiigiAdminYksus.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
