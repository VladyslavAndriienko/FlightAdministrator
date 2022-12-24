public interface IDataBuilder {
    IDataBuilder build();
    SObject get();
    IDataBuilder save();
    IDataBuilder save(Boolean withSave);
}