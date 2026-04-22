# Best Practices for Increasing Battery Life on MacBook

`lithium-ion batteries`
- charge quickly, long-lasting
- prefers consistent, moderate usage rather than extreme cycles

All rechargeable batteries are consumable components that become less effective as they chemically age.
- resulting in reduced battery life and reduced peak performance

A battery's chemical age 
- results from a complex combination of factors, including temperature history and charging pattern 



A `battery charge cycle` happens when you use all of the battery’s power-but that doesn’t necessarily mean in a single charge.
- e.g: you could use half of your laptop's charge in one day, and then recharge it fully and do the same thing the next day -- in this case, it might take several days to complete a cycle

Batteries have a limited amount of charge cycles before their performance is expected to diminish. 
- battery is designed to retain up to 80% of its original charge capacity at its maximum cycle count
- once the cycle count is reached, a replacement battery is recommended to maintain performance

Battery cycle count:
- MacBook M5: maximum cycle count -- 1000
- `Option` hold + Apple Menu → `System Information` → `Power` → `Cycle Count` 



`“Battery life”`: the amount of time your device runs before it needs to be recharged

`“Battery lifespan”`: the amount of time your battery lasts until it needs to be replaced.

---

## Do's and Don'ts for Battery Health

✅ Don't Fear the Plug
- if you are near an outlet and doing intensive work (like video rendering or compiling large projects), keep it plugged in
- this allows the system to pull power directly from the wall rather than cycling the battery
- 100% or 80% via Optimization and is plugged in, the 
  - MacBook uses a "power passthrough" system
  - it stops charging the battery and runs the hardware directly from the power brick
  - this means you aren't "cycling" the battery while you work, which is actually better than constantly draining and recharging it

✅ to avoid Screen Burn-in
  - ensure your `Screen Saver` or `Display Off` timer is set to something reasonable (like 5 or 10 minutes)
  - press `Command` + `Control` + `Q` to lock the screen instantly as you walk away

✅ make sure your MacBook is plugged in and powered on when you’re using it to charge other devices
-  if another device is connected to your MacBook when it’s turned off or in sleep or standby mode, the device’s battery may drain

✅ The "Exercise" Rule
- even if you have power access 24/7, it is a good habit to unplug the machine and let the battery drain down to about 20% or 30% once every few weeks, then plug it back in
- this "exercises" the battery cells and ensures the internal battery management system stays calibrated and accurate

✅ `"Wake for network access", if it is plugged into power`
- Apple Menu → `System Settings` → `Battery` → `Options` → turn on `“Wake for network access”`
- this allows the Mac to wake up from sleep to perform tasks that require network access, such as receiving notifications, syncing data, or performing background updates, even when the lid is closed and the display is off

✅ `Prevent automatic sleeping on power adapter when the display is off`
- Apple Menu → `System Settings` → `Battery` → `Options` → turn on `“Prevent automatic sleeping on power adapter when the display is off”`
- this allows the Mac to stay awake and perform background tasks even when the display is off, which can help keep the system responsive and up-to-date without needing to open the lid or wake it

✅ If you turn off your MacBook for night and keep it plugged during the day
- Wake Up Impact: 
  - when you flip the power switch back on and open the lid, the MacBook sees a "Power Attached" signal
  - this is usually when macOS tries to perform background tasks like: Spotlight indexing, iCloud syncing, Software update checks
  - if you notice the fans spinning up or the chassis getting warm right after you "start your day," it’s likely because the Mac is catching up on all the work it deferred while the power was cut
- tunrn on `"Wake for network access", if it is plugged into power` and `Prevent automatic sleeping on power adapter when the display is off` and leave the lid open during the day breaks
  - Leave the Mac plugged in and on during day breaks: The Mac stays up-to-date and ready to go the second you open it
  - If you turn the power off: The Mac "truly" sleeps


---

✅ avoid 0% and 100%
- lithium-ion batteries experience the most stress when they are completely empty or completely full
- try to keep your battery level between 20% and 80% for daily use

✅ avoid deep discharges
- letting the laptop die completely is more "expensive" for the battery's health than charging it frequently

✅ turn on `Optimized Battery Charging` to help reduce battery aging
- Apple Menu → `System Settings` → `Battery` → `info` button next to `Charging` → `Optimized Battery Charging`
  - lets your Mac learn your charging routine so that it can delay completing a full charge in certain situations
  - this prevents the battery from sitting at 100% for long hours
- when charging past 80% is delayed by this feature, `"Charging On Hold"` appears in the battery status menu
  - if you need your Mac to be charged to 100% sooner, choose `"Charge to Full Now"` from the menu
- with `Charge Limit`, you can limit what your Mac considers a full charge
  - your Mac will charge to within a few percentage points of the charge limit, then stop charging and show `"Charged to [%] Limit"` in the battery status menu
  - if the battery charge level drops more than 5% while connected to power, charging resumes, again charging to within a few percentage points of the limit
- charging may pause temporarily while in extreme temperature conditions, and will resume once the battery’s temperature returns to its normal operating range

✅ update to the latest software

✅ Apple menu > `System Settings` → `Battery` → `Options` → turn on `“Optimize video streaming while on battery”`

✅ Apple menu > `System Settings` → `Battery` → `Options` → turn on `“Slightly dim display on battery"`

---

✅ avoid extreme ambient temperatures
- MacBook: 
  - works best at: 10° to 35° C
  - storage temperature: -20° to 45° C
- temperatures higher than 35° C can permanently damage battery capacity
- charging the device in high ambient temperatures can damage it 
- even storing a battery in a hot environment can damage it irreversibly
- when using your device in a very cold environment, you may notice a decrease in battery life, but this condition is temporary
  - once the battery’s temperature returns to its normal operating range, its performance will return to normal as well

✅ Watch the Heat
- heat is the #1 killer of battery longevity
- avoid using your MacBook on soft surfaces like beds or pillows that block airflow
- ensure the laptop has plenty of airflow
- if it stays docked and closed, consider a stand that allows the bottom case to breathe
- keep the lid open and don't use keyboard covers that trap heat 
- if you keep it plugged in while performing high-intensity tasks (like heavy compiling or data processing), the laptop will generate heat

✅ remove certain cases during charging
- charging your device when it’s inside certain styles of cases may generate excess heat
- if you notice that your device gets hot when you charge it, take it out of its case first

---

✅ store it half-charged when you store it long term
- key factors affecting the overall health of your battery when storing: 
  - the environmental temperature 
  - the percentage of charge on the battery when it’s powered down for storage
- charge it to around 50%
  - fully discharged → battery could fall into a deep discharge state -- renders it incapable of holding a charge
  - fully charged → risk of capacity loss -- leads to a shorter battery lifespan
- if you plan to store your device for longer than six months, charge it to 50% every six months

### Charging

MacBook Pro supports charging via any of the `Thunderbolt (USB-C)` ports or the `MagSafe 3` port.

- `MagSafe 3`: generally preferred for stationary charging
  - the magnetic connection prevents the laptop from flying off a desk if someone trips over the cable, and the LED indicator (amber for charging, green for full) gives a quick status update

- `USB-C`: highly convenient for "one-cable" setups with external monitors or generic chargers

- `Power Brick`: to get the fastest charging speeds (`Fast Charge`)
  - use the Apple-branded high-wattage adapter (96W or 140W depending on your specific model) paired with the MagSafe cable


## Reduce Battery Usage

✅ optimize your settings to reduce battery usage
- Energy: Energy Saver | `Low Power Mode`
  -  when using battery power, it dims the screen and uses other components sparingly
  -  if you know you'll be away from a charger for a long time, toggle this on to reduce energy usage by lowering screen brightness and capping CPU clock speeds
- Brightness: dim the screen to the lowest comfortable level 
- Wi-Fi: turn off Wi-Fi when not in use
- Bluetooth: turn off Bluetooth when not in use
- Applications & Peripherals: close apps that are not in use and disconnect peripherals when not needed
  - e.g: eject and SD card if you're not currently accessing it
- Shutdown Background Apps: 
  - to find out what processes are running: `Applications` > `Utilities` > `Activity Monitor`
  - close the items that you are sure you don’t need running right now


# Keyboard Covers and Screen Protectors

✅ avoid keyboard covers 
- Screen Damage: The clearance between the keyboard and the display when the lid is closed is measured in fractions of a millimeter. A keyboard cover—even a "thin" silicone one—creates enough pressure to compress the screen, which can cause permanent key-shaped marks on the anti-reflective coating or, in worst-case scenarios, crack the LCD panel.
- Heat Dissipation: Modern MacBooks use the keyboard area as a secondary path for heat to escape. Covering it can trap heat, causing the fans to run louder or the system to throttle performance during intensive tasks.

✅ avoid screen protectors
- Adhesive Issues: The chemical adhesives on many protectors can react with Apple's factory coating. When you eventually remove the protector, it may peel off the original anti-reflective layer (a phenomenon sometimes called "Staingate").
- Visual Fidelity: Adding a matte layer often introduces "noise" or a grainy texture, which reduces the sharpness and color accuracy of the Liquid Retina XDR display.

## Recommendations

- For the Screen: Use a clean, dry microfiber cloth for daily cleaning. If there are stubborn smudges, use a tiny amount of water or a specialized screen cleaner (like Whoosh) applied to the cloth first—never directly on the glass.

- For the Keyboard: Instead of a cover, wash your hands before long sessions and use a can of compressed air to blow out debris. If you must use a cover while typing, remove it before closing the lid.

- For Glare: If you work in high-glare environments, try to adjust your positioning relative to light sources or use the "Display" settings to increase brightness, as the M5-series panels are designed to be bright enough to overpower most reflections.

# Handling MacBook Cybersickness

✅ Enable Reduce Motion
- `System Settings` > `Accessibility` > `Motion` > `Reduce Motion`

✅ Adjust Scroll Speed and Inertia
- `System Settings` > `Accessibility` > `Pointer Control` > `Trackpad Options` > `Scroll & Zoom` 
  - `Scrolling Speed`: set to lower value
  - disable `Use inertia` (or `"Smooth Scrolling"`) so the movement stops exactly when your fingers do
  
✅ Browser-Specific Tweaks
- Reduce Motion in Safari/Chrome: When you enable "Reduce Motion" in system settings, most modern browsers automatically respect that and disable smooth-scroll animations within websites.
- Avoid Tab Overload: Rapidly clicking through many tabs can create a strobing effect. Try using a "List View" for tabs if you use a browser like SigmaOS or Arc, or use `Cmd` + `Shift` + `[` and `Cmd` + `Shift` + `]` to navigate tabs more predictably than clicking

✅ Physical Environment & Habits
- Increase Ambient Light: Cybersickness is worse in dark rooms because the screen becomes your entire world. Ensure there is plenty of light behind the monitor to give your peripheral vision a "grounding" point that isn't moving.
- The 20-20-20 Rule: Every 20 minutes, look at something 20 feet away for 20 seconds. This resets your depth perception and inner ear balance.
- Size of the Window: If full-screen scrolling is too much, try using your browser in a smaller window rather than full-screen. This keeps the "stationary" wallpaper visible in your periphery, which tells your brain you aren't actually moving.

✅ Hardware Calibration
- Try a Fixed Refresh Rate: For some, the variable nature of `ProMotion` (switching between 10Hz and 120Hz) causes issues.
  - go to `System Settings` > `Displays`
  - in the `Refresh Rate` dropdown, try switching from `ProMotion` to a fixed `60Hz`
  - this provides a more consistent, "flatter" visual experience that is often easier on the vestibular system
