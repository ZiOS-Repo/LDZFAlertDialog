//
//  easing.h
//
//  Copyright (c) 2011, Auerhaus Development, LLC
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//  

#ifndef AH_EASING_H
#define AH_EASING_H

#if defined(__LP64__) && !defined(AH_EASING_USE_DBL_PRECIS)
#define AH_EASING_USE_DBL_PRECIS
#endif

#ifdef AH_EASING_USE_DBL_PRECIS
#define IUAHFloat double
#else
#define IUAHFloat float
#endif

typedef IUAHFloat (*IUAHEasingFunction)(IUAHFloat);

// Linear interpolation (no easing)
IUAHFloat IULinearInterpolation(IUAHFloat p);

// Quadratic easing; p^2
IUAHFloat IUQuadraticEaseIn(IUAHFloat p);
IUAHFloat IUQuadraticEaseOut(IUAHFloat p);
IUAHFloat IUQuadraticEaseInOut(IUAHFloat p);

// Cubic easing; p^3
IUAHFloat IUCubicEaseIn(IUAHFloat p);
IUAHFloat IUCubicEaseOut(IUAHFloat p);
IUAHFloat IUCubicEaseInOut(IUAHFloat p);

// Quartic easing; p^4
IUAHFloat IUQuarticEaseIn(IUAHFloat p);
IUAHFloat IUQuarticEaseOut(IUAHFloat p);
IUAHFloat IUQuarticEaseInOut(IUAHFloat p);

// Quintic easing; p^5
IUAHFloat IUQuinticEaseIn(IUAHFloat p);
IUAHFloat IUQuinticEaseOut(IUAHFloat p);
IUAHFloat IUQuinticEaseInOut(IUAHFloat p);

// Sine wave easing; sin(p * PI/2)
IUAHFloat IUSineEaseIn(IUAHFloat p);
IUAHFloat IUSineEaseOut(IUAHFloat p);
IUAHFloat IUSineEaseInOut(IUAHFloat p);

// Circular easing; sqrt(1 - p^2)
IUAHFloat IUCircularEaseIn(IUAHFloat p);
IUAHFloat IUCircularEaseOut(IUAHFloat p);
IUAHFloat IUCircularEaseInOut(IUAHFloat p);

// Exponential easing, base 2
IUAHFloat IUExponentialEaseIn(IUAHFloat p);
IUAHFloat IUExponentialEaseOut(IUAHFloat p);
IUAHFloat IUExponentialEaseInOut(IUAHFloat p);

// Exponentially-damped sine wave easing
IUAHFloat IUElasticEaseIn(IUAHFloat p);
IUAHFloat IUElasticEaseOut(IUAHFloat p);
IUAHFloat IUElasticEaseInOut(IUAHFloat p);

// Overshooting cubic easing; 
IUAHFloat IUBackEaseIn(IUAHFloat p);
IUAHFloat IUBackEaseOut(IUAHFloat p);
IUAHFloat IUBackEaseInOut(IUAHFloat p);

// Exponentially-decaying bounce easing
IUAHFloat IUBounceEaseIn(IUAHFloat p);
IUAHFloat IUBounceEaseOut(IUAHFloat p);
IUAHFloat IUBounceEaseInOut(IUAHFloat p);

#endif
