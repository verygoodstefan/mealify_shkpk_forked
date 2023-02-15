// ignore_for_file: public_member_api_docs, sort_constructors_first
/// {@template recipes_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class RecipesRepository {
  final TheMealDbApiClient mealDbApiClient;
  final TheCocktailDbApiClient cocktailDbApiClient;

  /// {@macro recipes_repository}
  const RecipesRepository(
    this.mealDbApiClient,
    this.cocktailDbApiClient,
  );
}

class TheMealDbApiClient {
  dynamic getRandomMeal() {
    return {
      'meals': [
        {
          'idMeal': '52925',
          'strMeal': 'Split Pea Soup',
          'strDrinkAlternate': null,
          'strCategory': 'Side',
          'strArea': 'Canadian',
          'strInstructions':
              'Put the gammon in a very large pan with 2 litres water and bring to the boil. Remove from the heat and drain off the water \u2013 this helps to get rid of some of the saltiness. Recover with 2 litres cold water and bring to the boil again. Put everything but the frozen peas into the pan and bring to the boil. Reduce to a simmer and cook for 1\u00bd-2\u00bd hrs, topping up the water as and when you need to, to a similar level it started at. As the ham cooks and softens, you can halve it if you want, so it is all submerged under the liquid. When the ham is tender enough to pull into shreds, it is ready.\r\nLift out the ham, peel off and discard the skin. While it is still hot (wear a clean pair of rubber gloves), shred the meat. Remove bay from the soup and stir in the frozen peas. Simmer for 1 min, then blend until smooth. Add a splash of water if too thick, and return to the pan to heat through if it has cooled, or if you are making ahead.\r\nWhen you are ready to serve, mix the hot soup with most of the ham \u2013 gently reheat if made ahead. Serve in bowls with the remaining ham scattered on top, and eat with crusty bread and butter.',
          'strMealThumb':
              'https://www.themealdb.com/images/media/meals/xxtsvx1511814083.jpg',
          'strTags': 'Soup,Warm',
          'strYoutube': 'https://www.youtube.com/watch?v=qdhWz7qAaCU',
          'strIngredient1': 'Ham',
          'strIngredient2': 'Peas',
          'strIngredient3': 'Onions',
          'strIngredient4': 'Carrots',
          'strIngredient5': 'Bay Leaves',
          'strIngredient6': 'Celery',
          'strIngredient7': 'Frozen Peas',
          'strIngredient8': 'Bread',
          'strIngredient9': '',
          'strIngredient10': '',
          'strIngredient11': '',
          'strIngredient12': '',
          'strIngredient13': '',
          'strIngredient14': '',
          'strIngredient15': '',
          'strIngredient16': '',
          'strIngredient17': '',
          'strIngredient18': '',
          'strIngredient19': '',
          'strIngredient20': '',
          'strMeasure1': '1kg',
          'strMeasure2': '200g (soaked overnight)',
          'strMeasure3': '2 chopped',
          'strMeasure4': '2 chopped',
          'strMeasure5': '2',
          'strMeasure6': '1 chopped',
          'strMeasure7': '300g',
          'strMeasure8': 'to serve',
          'strMeasure9': '',
          'strMeasure10': '',
          'strMeasure11': '',
          'strMeasure12': '',
          'strMeasure13': '',
          'strMeasure14': '',
          'strMeasure15': '',
          'strMeasure16': '',
          'strMeasure17': '',
          'strMeasure18': '',
          'strMeasure19': '',
          'strMeasure20': '',
          'strSource':
              'https://www.bbcgoodfood.com/recipes/1022639/split-pea-and-green-pea-smoked-ham-soup',
          'strImageSource': null,
          'strCreativeCommonsConfirmed': null,
          'dateModified': null
        }
      ]
    };
  }
}

class TheCocktailDbApiClient {
  dynamic getRandomCocktail() {
    return {
      'drinks': [
        {
          'idDrink': '17198',
          'strDrink': 'French Connection',
          'strDrinkAlternate': null,
          'strTags': 'IBA,ContemporaryClassic',
          'strVideo': null,
          'strCategory': 'Ordinary Drink',
          'strIBA': 'Contemporary Classics',
          'strAlcoholic': 'Alcoholic',
          'strGlass': 'Old-fashioned glass',
          'strInstructions':
              'Pour all ingredients directly into old fashioned glass filled with ice cubes. Stir gently.',
          'strInstructionsES': null,
          'strInstructionsDE':
              'Alle Zutaten direkt in ein old fashioned Glas mit Eisw\u00fcrfeln geben. Vorsichtig umr\u00fchren.',
          'strInstructionsFR': null,
          'strInstructionsIT':
              'Unisci gin, zucchero e succo di limone in uno shaker pieno di ghiaccio.\r\nShakerare energicamente e filtrare in una coppa da champagne ghiacciata.\r\nRabboccare il bicchiere con lo champagne.\r\nMescola delicatamente.',
          'strInstructionsZH-HANS': null,
          'strInstructionsZH-HANT': null,
          'strDrinkThumb':
              'https://www.thecocktaildb.com/images/media/drink/zaqa381504368758.jpg',
          'strIngredient1': 'Cognac',
          'strIngredient2': 'Amaretto',
          'strIngredient3': null,
          'strIngredient4': null,
          'strIngredient5': null,
          'strIngredient6': null,
          'strIngredient7': null,
          'strIngredient8': null,
          'strIngredient9': null,
          'strIngredient10': null,
          'strIngredient11': null,
          'strIngredient12': null,
          'strIngredient13': null,
          'strIngredient14': null,
          'strIngredient15': null,
          'strMeasure1': '1 1/2 oz ',
          'strMeasure2': '3/4 oz ',
          'strMeasure3': null,
          'strMeasure4': null,
          'strMeasure5': null,
          'strMeasure6': null,
          'strMeasure7': null,
          'strMeasure8': null,
          'strMeasure9': null,
          'strMeasure10': null,
          'strMeasure11': null,
          'strMeasure12': null,
          'strMeasure13': null,
          'strMeasure14': null,
          'strMeasure15': null,
          'strImageSource': null,
          'strImageAttribution': null,
          'strCreativeCommonsConfirmed': 'No',
          'dateModified': '2017-09-02 17:12:39'
        }
      ]
    };
  }
}
