import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/dummy_data.dart';
import 'package:tastynav_cuisines/model/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key});
  static const routeName = '/meal-details';

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientItem(String ingredient, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: Colors.amber.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              ingredient,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF2D3436),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(String step, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF2D3436),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                step,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2D3436),
                  height: 1.6,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3436),
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF2D3436)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Hero(
              tag: meal.id,
              child: Container(
                height: 340,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Image.network(
                      meal.imageUrl,
                      height: 340,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                      child: Text(
                        meal.title,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2D3436),
                              letterSpacing: 0.5,
                            ),
                      ),
                    ),

                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _buildInfoChip(
                            Icons.schedule_rounded,
                            '${meal.duration} min',
                            context,
                          ),
                          _buildInfoChip(
                            Icons.whatshot_rounded,
                            meal.complexity.name.toUpperCase(),
                            context,
                          ),
                          _buildInfoChip(
                            Icons.restaurant_rounded,
                            meal.affordability.name.toUpperCase(),
                            context,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Ingredients Section
                    _buildSectionHeader(
                      context,
                      'Ingredients',
                      Icons.shopping_basket_rounded,
                    ),
                    const SizedBox(height: 8),
                    ...meal.indgredients
                        .asMap()
                        .entries
                        .map((entry) => _buildIngredientItem(entry.value, entry.key))
                        .toList(),
                    const SizedBox(height: 32),

                    
                    _buildSectionHeader(
                      context,
                      'Instructions',
                      Icons.format_list_numbered_rounded,
                    ),
                    const SizedBox(height: 8),
                    ...meal.steps
                        .asMap()
                        .entries
                        .map((entry) => _buildStepItem(entry.value, entry.key))
                        .toList(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}