import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  final List<Step> steps;
  final int currentStep;
  final Function()? goForward;
  final Function()? goBack;
  final Function(int)? onTap;
  const StepperWidget({
    Key? key,
    required this.steps,
    required this.currentStep,
    required this.goForward,
    required this.goBack,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (context, controller) {
        return const SizedBox.shrink();
      },
      physics: const ClampingScrollPhysics(),
      type: StepperType.horizontal,
      elevation: 0.0,
      currentStep: currentStep,
      onStepTapped: onTap,
      onStepContinue: goForward,
      onStepCancel: goBack,
      steps: steps,
    );
  }
}
