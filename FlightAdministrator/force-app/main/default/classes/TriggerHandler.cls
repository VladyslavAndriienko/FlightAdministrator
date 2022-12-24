/**
 * Abstract class which implements trigger handlers.
 * It contains additional logic which is common for all triggers.
 */
public abstract class TriggerHandler {

    public virtual void beforeInsert() {}
    public virtual void beforeUpdate() {}
    public virtual void beforeDelete() {}
    public virtual void afterInsert() {}
    public virtual void afterUpdate() {}
    public virtual void afterDelete() {}
    public virtual void afterUndelete() {}
    
    public virtual void handle() {
        if(Trigger.isBefore) {
            if(Trigger.isInsert) {
                beforeInsert();
            } else if(Trigger.isUpdate) {
                beforeUpdate();
            } else if(Trigger.isDelete) {
                beforeDelete();
            }
        } else if(Trigger.isAfter) {
            if(Trigger.isInsert) {
                afterInsert();
            } else if(Trigger.isUpdate) {
                afterUpdate();
            } else if(Trigger.isDelete) {
                afterDelete();
            } else if(Trigger.isUndelete) {
                afterUndelete();
            }
        }
    }
}