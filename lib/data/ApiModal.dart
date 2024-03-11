

class ApiModal{
   String recipename;
   String recipe_image;
   String recipe_source;
   ApiModal({
     this.recipename='',this.recipe_image='', this.recipe_source=''
});
    factory ApiModal.fromMap(Map recipe){
      return ApiModal(
        recipename: recipe["label"],
        recipe_image: recipe["image"],
        recipe_source: recipe["url"]
      );
    }




}