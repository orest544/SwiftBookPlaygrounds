
var orestWorkout = (pushUp:50, pullUp:20, squatting:100)

print(orestWorkout)

print("Orest workout values:")
print("Maximum push ups: \(orestWorkout.0)")
print("Maximum pull ups: \(orestWorkout.1)")
print("Maximum squattings: \(orestWorkout.2)")

print("\n")

print("Orest workout values:")
print("Maximum push ups: \(orestWorkout.pushUp)")
print("Maximum pull ups: \(orestWorkout.pullUp)")
print("Maximum squattings: \(orestWorkout.squatting)")

var iraWorkout = (pushUp:5, pullUp:1, squatting:50)
print("Orest:\(orestWorkout)")
print("Ira:\(iraWorkout)")

var temp = 0

temp = orestWorkout.pushUp
orestWorkout.pushUp = iraWorkout.pushUp
iraWorkout.pushUp = temp

temp = orestWorkout.pullUp
orestWorkout.pullUp = iraWorkout.pullUp
iraWorkout.pullUp = temp

temp = orestWorkout.squatting
orestWorkout.squatting = iraWorkout.squatting
iraWorkout.squatting = temp

let differenceValueWorkout = (pushUp:(iraWorkout.pushUp - orestWorkout.pushUp), pullUp:(iraWorkout.pullUp - orestWorkout.pullUp), squatting:(iraWorkout.squatting - orestWorkout.squatting))

print("differences:\n\(differenceValueWorkout)")






















