/*
 * Copyright 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package androidx.compose.material.demos

import androidx.compose.Composable
import androidx.ui.core.Modifier
import androidx.compose.foundation.Text
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material.MaterialTheme
import androidx.compose.material.samples.SliderSample
import androidx.compose.material.samples.StepsSliderSample
import androidx.compose.ui.unit.dp

@Composable
fun SliderDemo() {
    val headerStyle = MaterialTheme.typography.h6
    Column(Modifier.padding(10.dp)) {
        Text(text = "Continuous Slider", style = headerStyle)
        Spacer(Modifier.height(16.dp))
        SliderSample()
        Spacer(Modifier.height(16.dp))
        Text(text = "Discrete Slider with custom color", style = headerStyle)
        Spacer(Modifier.height(16.dp))
        StepsSliderSample()
    }
}
