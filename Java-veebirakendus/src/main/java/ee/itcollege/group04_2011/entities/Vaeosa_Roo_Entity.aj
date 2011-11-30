// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.group04_2011.entities;

import ee.itcollege.group04_2011.entities.Vaeosa;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Vaeosa_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Vaeosa.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer Vaeosa.version;
    
    public Integer Vaeosa.getVersion() {
        return this.version;
    }
    
    public void Vaeosa.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Vaeosa.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Vaeosa.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Vaeosa attached = Vaeosa.findVaeosa(this.vaeosaIdId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Vaeosa.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Vaeosa.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Vaeosa Vaeosa.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Vaeosa merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Vaeosa.entityManager() {
        EntityManager em = new Vaeosa().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Vaeosa.countVaeosas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Vaeosa o", Long.class).getSingleResult();
    }
    
    public static List<Vaeosa> Vaeosa.findAllVaeosas() {
        return entityManager().createQuery("SELECT o FROM Vaeosa o", Vaeosa.class).getResultList();
    }
    
    public static Vaeosa Vaeosa.findVaeosa(Long vaeosaIdId) {
        if (vaeosaIdId == null) return null;
        return entityManager().find(Vaeosa.class, vaeosaIdId);
    }
    
    public static List<Vaeosa> Vaeosa.findVaeosaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Vaeosa o", Vaeosa.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
