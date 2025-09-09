import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/add_recipes/widgets/add_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/ingredient_row.dart';
import 'widgets/instruction_row..dart';
import 'widgets/section_title.dart';


class AddResipeisPage extends StatefulWidget {
  @override
  _RecipeCreatorPageState createState() => _RecipeCreatorPageState();
}

class _RecipeCreatorPageState extends State<AddResipeisPage>
    with TickerProviderStateMixin {
  final TextEditingController _recipeNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cookTimeController = TextEditingController();

  List<Map<String, TextEditingController>> ingredients = [
    {'amount': TextEditingController(), 'name': TextEditingController()}
  ];
  List<TextEditingController> instructions = [TextEditingController()];

  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
    _fadeController.forward();
    _scaleController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _recipeNameController.dispose();
    _descriptionController.dispose();
    _cookTimeController.dispose();
    for (var ingredient in ingredients) {
      ingredient['amount']?.dispose();
      ingredient['name']?.dispose();
    }
    for (var instruction in instructions) {
      instruction.dispose();
    }
    super.dispose();
  }

  void _addIngredient() {
    setState(() {
      ingredients.add({
        'amount': TextEditingController(),
        'name': TextEditingController(),
      });
    });
  }

  void _removeIngredient(int index) {
    if (ingredients.length > 1) {
      setState(() {
        ingredients[index]['amount']?.dispose();
        ingredients[index]['name']?.dispose();
        ingredients.removeAt(index);
      });
    }
  }

  void _addInstruction() {
    setState(() {
      instructions.add(TextEditingController());
    });
  }

  void _removeInstruction(int index) {
    if (instructions.length > 1) {
      setState(() {
        instructions[index].dispose();
        instructions.removeAt(index);
      });
    }
  }

  void saveRecipe() {
    Map<String, dynamic> recipe = {
      'name': _recipeNameController.text.isEmpty
          ? 'Untitled Recipe'
          : _recipeNameController.text,
      'description': _descriptionController.text.isEmpty
          ? 'No description'
          : _descriptionController.text,
      'cookTime': _cookTimeController.text.isEmpty
          ? 'Not specified'
          : _cookTimeController.text,
      'ingredients': ingredients
          .where((ing) =>
      ing['amount']!.text.isNotEmpty || ing['name']!.text.isNotEmpty)
          .map((ing) => {
        'amount': ing['amount']!.text,
        'name': ing['name']!.text,
      })
          .toList(),
      'instructions': instructions
          .where((inst) => inst.text.isNotEmpty)
          .map((inst) => inst.text)
          .toList(),
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8.w),
            Text('Recipe saved successfully!'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: "Create Recipe"),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 177.w,
                        height: 27.h,
                        decoration: BoxDecoration(
                            color: AppColors.pink,
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                          child: Text(
                            'Publish',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.redPinkMain,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        width: 177.w,
                        height: 27.h,
                        decoration: BoxDecoration(
                            color: AppColors.pink,
                            borderRadius: BorderRadius.circular(14.r)),
                        child: Center(
                          child: Text(
                            'Delete',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.redPinkMain,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    "assets/ananas.png",
                    width: 362.w,
                    height: 281.h,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle('Title'),
                          CustomTextField(
                            controller: _recipeNameController,
                            hintText: 'Pina Colada',
                          ),
                          SectionTitle('Description'),
                          CustomTextField(
                            controller: _descriptionController,
                            hintText: 'A tropical explosion in every sip',
                          ),
                          SectionTitle('Time Recipe'),
                          CustomTextField(
                            controller: _cookTimeController,
                            hintText: '30min',
                          ),
                          SectionTitle('Ingredients'),
                          ...ingredients
                              .asMap()
                              .entries
                              .map((entry) => IngredientRow(
                            index: entry.key,
                            ingredients: ingredients,
                            removeIngredient: _removeIngredient,
                          )),
                          Center(child: AddButton('+ Add Ingredient', _addIngredient)),
                          SizedBox(height: 20),
                          SectionTitle('Instructions'),
                          ...instructions
                              .asMap()
                              .entries
                              .map((entry) => InstructionRow(
                            index: entry.key,
                            instructions: instructions,
                            removeInstruction: _removeInstruction,
                          )),
                          Center(child: AddButton('+ Add Instruction', _addInstruction)),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
