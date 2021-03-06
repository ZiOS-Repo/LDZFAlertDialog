/**
 * Tencent is pleased to support the open source community by making QMUI_iOS available.
 * Copyright (C) 2016-2020 THL A29 Limited, a Tencent company. All rights reserved.
 * Licensed under the MIT License (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://opensource.org/licenses/MIT
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
//
//  UITextInputTraits+QMUI.m
//  QMUIKit
//
//  Created by MoLice on 2019/O/16.
//

#import "UITextInputTraits+QMUI.h"
#import "QMUICore.h"

@interface NSObject ()

@property(nonatomic, assign) BOOL qti_didInitialize;
@end

@implementation NSObject (QMUITextInput)

QMUISynthesizeBOOLProperty(qti_didInitialize, setQti_didInitialize)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static NSArray<Class> *inputClasses = nil;
        if (!inputClasses) inputClasses = @[UITextField.class, UITextView.class, UISearchBar.class];
        [inputClasses enumerateObjectsUsingBlock:^(Class  _Nonnull inputClass, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ExtendImplementationOfNonVoidMethodWithSingleArgument(inputClass, @selector(initWithFrame:), CGRect, UIView<UITextInputTraits> *, ^UIView<UITextInputTraits> *(UIView<UITextInputTraits> *selfObject, CGRect firstArgv, UIView<UITextInputTraits> *originReturnValue) {
                if (QMUICMIActivated) selfObject.keyboardAppearance = KeyboardAppearance;
                selfObject.qti_didInitialize = YES;
                return originReturnValue;
            });
            
            ExtendImplementationOfNonVoidMethodWithSingleArgument(inputClass, @selector(initWithCoder:), NSCoder *, UIView<UITextInputTraits> *, ^UIView<UITextInputTraits> *(UIView<UITextInputTraits> *selfObject, NSCoder *aDecoder, UIView<UITextInputTraits> *originReturnValue) {
                selfObject.qti_didInitialize = YES;
                return originReturnValue;
            });
            
            // ???????????????????????????????????????????????????keyboardAppearance ?????????????????????????????????????????????
            OverrideImplementation(inputClass, @selector(setKeyboardAppearance:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
                return ^(UIView<UITextInputTraits> *selfObject, UIKeyboardAppearance keyboardAppearance) {

                    BOOL valueChanged = selfObject.keyboardAppearance != keyboardAppearance;
                    
                    // call super
                    void (*originSelectorIMP)(id, SEL, UIKeyboardAppearance);
                    originSelectorIMP = (void (*)(id, SEL, UIKeyboardAppearance))originalIMPProvider();
                    originSelectorIMP(selfObject, originCMD, keyboardAppearance);
                    
                    if (selfObject.qti_didInitialize && valueChanged) {
                        // ?????????????????????????????????????????????????????????????????? QMUITheme ???????????????????????????????????????
                        if (QMUICMIActivated) selfObject.qmui_hasCustomizedKeyboardAppearance = YES;
                        
                        // ??????????????????????????????????????????????????????????????? isFristResponder ???????????? reloadInputViews ?????????????????????
                        [selfObject reloadInputViews];
                    }
                };
            });
        }];
    });
}

@end

@implementation NSObject (QMUITextInput_Private)

QMUISynthesizeBOOLProperty(qmui_hasCustomizedKeyboardAppearance, setQmui_hasCustomizedKeyboardAppearance)

@end
