import 'package:flutter/material.dart';
import 'package:counter_app/util/colors.dart';
import 'package:counter_app/util/dimens.dart';
import 'package:counter_app/util/app_texts.dart';
import 'package:counter_app/util/text_styles.dart';

class NoteSection extends StatefulWidget {
  final String? note;
  final Function(String) onSave;
  
  const NoteSection({
    Key? key,
    required this.note,
    required this.onSave,
  }) : super(key: key);

  @override
  State<NoteSection> createState() => _NoteSectionState();
}

class _NoteSectionState extends State<NoteSection> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.note ?? '');
  }

  @override
  void didUpdateWidget(covariant NoteSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.note != oldWidget.note) {
      _controller.text = widget.note ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.paddingL),
      decoration: BoxDecoration(
        color: AppColors.getCardBackground(context),
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusLarge),
        border: Border.all(color: AppColors.getBorder(context).withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notes',
                style: AppTextStyles.sectionHeaderMedium(context),
              ),
              if (!_isEditing && (widget.note?.isNotEmpty ?? false))
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      _isEditing = true;
                    });
                    _focusNode.requestFocus();
                  },
                ),
            ],
          ),
          
          SizedBox(height: AppDimens.spaceM),
          
          if (_isEditing || widget.note == null || widget.note!.isEmpty)
            Column(
              children: [
                TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Add a note about this counter...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimens.borderRadiusM),
                    ),
                    filled: true,
                    fillColor: AppColors.getBackground(context),
                  ),
                  style: TextStyle(
                    fontSize: AppDimens.textSizeM,
                    color: AppColors.getTextPrimary(context),
                  ),
                ),
                
                SizedBox(height: AppDimens.spaceM),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isEditing = false;
                          _controller.text = widget.note ?? '';
                        });
                      },
                      child: Text('Cancel'),
                    ),
                    SizedBox(width: AppDimens.spaceS),
                    ElevatedButton(
                      onPressed: () {
                        widget.onSave(_controller.text);
                        setState(() {
                          _isEditing = false;
                        });
                      },
                      child: Text('Save Note'),
                    ),
                  ],
                ),
              ],
            )
          else
            GestureDetector(
              onTap: () {
                setState(() {
                  _isEditing = true;
                });
                _focusNode.requestFocus();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppDimens.paddingM),
                decoration: BoxDecoration(
                  color: AppColors.getBackground(context),
                  borderRadius: BorderRadius.circular(AppDimens.borderRadiusM),
                  border: Border.all(color: AppColors.getBorder(context)),
                ),
                child: Text(
                  widget.note!,
                  style: TextStyle(
                    fontSize: AppDimens.textSizeM,
                    color: AppColors.getTextPrimary(context),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}