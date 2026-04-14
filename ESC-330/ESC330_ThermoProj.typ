#import "conf.typ": conf
#import "@preview/axiom:0.1.0": *
#import "@preview/physica:0.9.8": *
#import "@preview/meander:0.4.1"
#import "@preview/callisto:0.2.5"
#import "@preview/circuiteria:0.2.0"

#show figure: set block(below: (2.0em))
#show columns: set text(size: 10pt)
#set heading(numbering: "A.i.")
#show heading: set text(size: 18pt, weight: "bold")
#show figure: set block(below: (2.0em))

#set math.equation(numbering: "(1)")
#let no-num(body) = math.equation(block: true, numbering: none, body)

#let date = datetime.today()
#show table.cell.where(y: 0): set text(weight: "bold")

// Document Parameters
#show: doc => conf(
  course_code: [ESC330/ChE233],
  course_title: [Engineering Thermodynamics],
  course_color: black,
  authors: ("Joshua Davidov", "Aiden Brady", "Susanna Denny", "Nora Gallion", "Angela Gray", "Neola Low"),
  title: [*Renewable Methane Project*],
  instructors: ("Professor Simson",
  "Professor Wright"),
  month: date.display("[month repr:long] [day],"),
  year: date.display("[year]"),
  doc,
)

// Document Contents

=


Methane emissions pose a significant risk to the environment. $C H_4$ has a GWP 28 times higher than that of $C O_2$ (GHGProtocol.org). Methane concentrations in the atmosphere have been rising more quickly than all other major gases (IEA.org). Methane is responsible for 30% of the rise in global temperatures. Annual global methane emissions are around 610 Mt, and roughly $2/3$ of that may be attributed to human activity. Of the 610 Mt, 145 Mt come from the energy sector.

=

Henry's law states that the amount of gas dissolved in a certain liquid is directly proportional to its partial pressure above that liquid. The Henry's law coefficient for $C O_2$ in water is 0.034 M/atm at 25°C (Chem LibreTexts), while for $C H_4$ in water it is 0.0014 (NIST Webbook). Therefore, $C O_2$ is more soluble in water than $C H_4$. Keeping the column at high pressures ensures a high exit velocity for the gas, since it moves from high to low pressure.


= 

We want to find the outlet temperature of the compressor.

Let $V$ be the molar volume of the biogas. Assume the compressor inlet and outlet conditions are:

#no-num($ p_1 = 1 "bar", quad T_1 = 27^ degree "C", quad p_2 = 1100 "kPa" $)

Using the isentropic relation together with the van der Waals equation of state,

#no-num($ d s = C_v (d T)/T + ((partial p)/(partial T))_v d V $)
#no-num($ p = (R T)/(V - b) - a/V^2 $)
#no-num($ ((partial p)/(partial T))_v = R/(V - b) $)

so that:

#no-num($ 0 = C_v ((d T)/T) + R/(V - b) d V $)
#no-num($ 0 = C_v ln(T_2/T_1) + R ln((V_2 - b)/(V_1 - b)) $)
#no-num($ C_v ln(T_2/T_1) = -R ln((V_2 - b)/(V_1 - b)) $)
#no-num($ (T_2/T_1)^(C_v) = ((V_2 - b)/(V_1 - b))^(-R) $)
#no-num($ T_2/T_1 = ((V_2 - b)/(V_1 - b))^(-R/C_v) $)

The system of equations used was:

#no-num($ T_2 = T_1 ((V_2 - b)/(V_1 - b))^(-R/C_v) $)
#no-num($ p V_2^3 - (p b + R T) V_2^2 + a V_2 - a b = 0 $)

Plugging in the values from the notes,

#no-num($ T_1 = 27^ degree "C" $)
#no-num($ V_1 = (22.4) "L"/"mol" quad "(I.G.)" $)
#no-num($ C_v = ((4.06) "J"/("g" dot "K"))((26 "g")/"mol") = (105.6) "J"/("mol" dot "K") $)
#no-num($ R = (8.314) "J"/("mol" dot "K") $)
#no-num($ b = (0.049) "L"/"mol" $)
#no-num($ a = (2.833) ("L"^2 dot "bar")/"mol"^2 $)

After using an equation solver with the aforementioned system of equations and given values, we get:

#no-num($ V_2 = (2.55) "L"/"mol" $)
#block(stroke: black, inset: 0.5em)[$ T_2 = 356 "K" $]

We expected a decrease in $V$ and an increase in $T$, so this is a logical result.

Note the molar mass of the biogas:

#no-num($ M = 0.64(16) + 0.36(44) = (26) "g"/"mol" $)

==
 
Note we can estimate the compressor power using:

#no-num($ dot(W) = dot(m) Delta h $)

so we begin by finding $dot(m)$ from the volumetric flow rate.

#no-num($ dot(V) = (1.2) "m"^3/("equiv" dot "day") times 2000 "cows" = (2400) "m"^3/"day" $)
#no-num($ dot(m) = rho dot(V) $)

For the biogas density, the notes use:

#no-num($ rho_"biogas" = 0.64 rho#sub[CH]_4 + 0.36 rho#sub[CO]_2 $)
#no-num($ rho#sub[CH]_4 = (0.66) "g"/"L", quad rho#sub[CO]_2 = (1.72) "g"/"L" $)
#no-num($ rho_"biogas" = (1.08) "g"/"L" $)

Therefore,

#no-num($ dot(m) = (1.08) "g"/"L" times (2400) "m"^3/"day" times (1000 "L")/(1 "m"^3) times (1 "kg")/(1000 "g") $)
#no-num($ dot(m) = (2592) "kg"/"day" $)
#no-num($ dot(m) = (2592) "kg"/"day" times (1440) "min"/"day" $)
#block(stroke: black, inset: 0.5em)[$ dot(m) = (1.8) "kg"/"min" $]

Using the ideal-gas enthalpy change,

#no-num($ Delta h = C_p Delta T $)
#no-num($ Delta h = (4.534) "kJ"/("kg" dot "K") times (348 "K" - 300 "K") $)
#no-num($ Delta h = (217.6) "kJ"/"kg" $)

so the estimated compressor power is:

#no-num($ dot(W)_"est." = (1.8) "kg"/"min" times (1 "min")/(60 "s") times (217.6) "kJ"/"kg" times (1000 "J")/(1 "kJ") $)
#block(stroke: black, inset: 0.5em)[$ dot(W)_"est." = 6528 "W" $]

==
The real-gas correction was then estimated with a residual-enthalpy approach. The notes use:

#no-num($ h_2^R = R T_2 (Z_2 - 1) + integral_[T, v = oo]^[T, v] (T ((partial p)/(partial T))_v - p) d v $)

Using the van der Waals equation,

#no-num($ p = (R T)/(v - b) - a/v^2 $)
#no-num($ p + a/v^2 = (R T)/(v - b) $)

which simplifies the integral so that:

#no-num($ h_2^R = R T_2 (Z_2 - 1) - a/v_2 $)

The pseudocritical properties in the notes are:

#no-num($ P_c = 0.64 P#sub[c, CH]_4 + 0.36 P#sub[c, CO]_2 $)
#no-num($ P_c = 0.64(4.592 "MPa") + 0.36(7.38 "MPa") = 5.6 "MPa" $)

#no-num($ T_c = 0.64 T#sub[c, CH]_4 + 0.36 T#sub[c, CO]_2 $)
#no-num($ T_c = 0.64(190.56 "K") + 0.36(304.13 "K") = 231.4 "K" $)

At state 2:

#no-num($ P_r = 1.1/5.6 = 0.20 $)
#no-num($ T_r = 348/231 = 1.5 $)

Using the generalized-compressibility estimate in the notes,

#no-num($ omega#sub[CH]_4 = 0.01, quad omega#sub[CO]_2 = 0.228 $)
#no-num($ omega = 0.64omega#sub[CH]_4 + 0.36omega#sub[CO]_2 = 0.088 $)
#no-num($ Z_2 = Z_0 + omega Z_1 = 0.983 $)

Then:

#no-num($ h_2^R = (8.314) "J"/("mol" dot "K") times 348 "K" times (0.983 - 1) - ((2.833 ("L"^2 dot "bar"))/"mol"^2)/((2.55 "L")/"mol") times (100 "J")/(1 "L" dot "bar") $)
#no-num($ h_2^R = (-160) "J"/"mol" $)
#no-num($ h_2^R = (-6.16) "kJ"/"kg" $)

So the corrected enthalpy change becomes:

#no-num($ Delta h = h_2^R + Delta h_"IG" - h_1^R $)
#no-num($ Delta h = (-6.16) "kJ"/"kg" + (217.6) "kJ"/"kg" $)
#no-num($ Delta h = (211) "kJ"/"kg" $)

and therefore:

#no-num($ dot(W) = dot(m) Delta h $)
#no-num($ dot(W) = (1.8) "kg"/"min" times (211) "kJ"/"kg" = (380) "kJ"/"min" $)
#block(stroke: black, inset: 0.5em)[$ dot(W) = 6344 "W" $]

==

The power for the real compressor is less than 200 W lower than that for an ideal gas, corresponding to a percent difference of about 2.9%. The wattage range is roughly 6300--6500 W, or about 8.5--8.7 hp, so compressors at this power are available online.

= 

The notes give the fuel-value calculation as:

#no-num($ (985.5) "kg"/"day" times (2.204) "lb"/"kg" times (22000) "BTU"/"lb" times (3.10) "$"/(10^6 "BTU") $)
#block(stroke: black, inset: 0.5em)[$ =("$"148) /"day" $]

The electricity-cost estimate is:

#no-num($ 6.344 "kW" times 24 "h"/"day" times 0.178 "$"/("kW" dot "h") $)
#block(stroke: black, inset: 0.5em)[$ =("$"27.10) /"day" $]

This suggests the process would be able to profit, since the cost is lower than the expected daily value.

= 

Natural gas should be used to avoid methane emissions. Also, RNG can spur economic development and is sourced renewably and domestically. However, RNGs rely on subsidies and government incentives to be economically viable. Since there is not as much existing infrastructure to support RNGs, conventional natural gas may often be cheaper in processing costs and can remain less expensive than methane capture before accounting for government support. Another risk is methane leaking in transit.

=

The notes compare the impact of venting the methane to the atmosphere against using electricity for compression.

#no-num($ (985.5) ("kg" C H_4)/"day" times 28 = (27594) ("kg" C O_2"e")/"day" $)

This is labeled as the $C O_2$e that would be emitted if the methane were simply released.

For the electricity use, the notes estimate:

#no-num($ 152.256 "kW" dot "h" times (1 "MWh")/(10^3 "kW" dot "h") times (1.1 times 10^3 "lb" C O_2"e")/(1 "MWh") times (1 "kg")/(2.204 "lb") $)
#block(stroke: black, inset: 0.5em)[$ =(76) ("kg" C O_2"e")/"day" $]

Therefore, emitting the methane rather than using it would release on the order of 350 times more $C O_2$e into the atmosphere. It is much better environmentally to use the methane.

=

RNG tax breaks still only apply for fuels (Dept. of Energy). The factory will buy waste from the farmer, rather than the farmer having to pay for waste removal.






