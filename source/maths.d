/**
 * Various pieces of mathematics that are needed for the mesh baker
 */

import std.stdio;
import std.math;
import std.format;
import std.conv;

struct vec3f {
	float x, y, z;
	
	this(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	
	vec3f opUnary(string s)() if (s == "-") {
		return vec3f(-x, -y, -z);
	}
	
	float lengthSquared() {
		return x * x + y * y + z * z;
	}
	
	float length() {
		return sqrt(this.lengthSquared());
	}
	
	float dot(vec3f other) {
		return x * other.x + y * other.y + z * other.z;
	}
	
	vec3f normalise() {
		return (1.0 / this.length()) * this;
	}
	
	vec3f cross(vec3f other) {
		writeln("vec3f.cross() is not implemented");
		return vec3f(0, 0, 0);
	}
	
	vec3f opBinary(string op : "+")(vec3f other) {
		return vec3f(this.x + other.x, this.y + other.y, this.z + other.z);
	}
	
	vec3f opBinary(string op : "-")(vec3f other) {
		return vec3f(this.x - other.x, this.y - other.y, this.z - other.z);
	}
	
	vec3f opBinary(string op : "*")(vec3f other) {
		return vec3f(this.x * other.x, this.y * other.y, this.z * other.z);
	}
	
	vec3f opBinary(string op : "*")(float other) {
		return vec3f(this.x * other, this.y * other, this.z * other);
	}
	
	vec3f opBinaryRight(string op : "*")(float other) {
		return vec3f(this.x * other, this.y * other, this.z * other);
	}
	
	string opCast(T)() if (is(T == string)) {
		return to!string(x) ~ " " ~ to!string(y) ~ " " ~ to!string(z);
	}
}

void Test_vec3f() {
	vec3f a, b;
	a = vec3f(1, 2, 3);
	b = vec3f(2, 3, 4);
	
	writeln(cast(string) a.normalise(), "\n", cast(string) b.normalise());
}
