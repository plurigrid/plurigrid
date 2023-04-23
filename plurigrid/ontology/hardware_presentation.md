# Introduction
Hello, my names Aja Sibley and I'm an engineer at Plurigrid. Today I'm going to tell you a little bit about what we've been working on in the realm of hardware. In order to really understand the problems were trying to solve today we need to take a look back and see how we got here:

# History of Computers
Babbage Engine (1837): Mechanical, programmable, memory

ENIAC (1946): Electronic, general-purpose, 30 tons

UNIVAC I (1951): Commercial success, Census Bureau, election predictions

IBM SAGE (1954-1963): Largest computer system, air defense, 23 installations

Fortran (1957): First high-level language, efficient, human-readable

Integrated Circuit (1958): Miniaturization, smaller, cheaper computers

IBM System/360 (1964): Compatible architecture, seamless hardware upgrades

ARPANET (1969): Wide-area network, groundwork for modern internet

Xerox Alto (1973): GUI, mouse, inspired personal computers

Apple II (1977): Mass-market success, color graphics, open architecture

IBM PC (1981): Standard PC architecture, Microsoft-Intel alliance

LISP Machines (1980s): Specialized hardware, optimized for LISP language, AI research

Connection Machine (1985): Massively parallel, up to 65,536 processors, AI and scientific applications

World Wide Web (1989): Global information-sharing, communication, commerce

Plan 9 (1992): Distributed computing, resource management, 9P protocol

Smartphones, tablets, IoT (2000s-present): Ubiquitous computing, first computers for billions, diverse applications

# Segway
So how does this any of this relate to the grid? Well the grid wasn't really designed with computers in mind, let alone all the new devices that have come out in the last 30 years. Some of the main problems we're facing today are:

# The Problem
Scalability: Massive increase in connected devices and energy demand

Intermittency: Integration of renewable energy sources with variable output

Distributed Generation: Microgrids, rooftop solar, and small-scale energy
production

Interoperability: Communication and coordination among diverse devices and systems

Cybersecurity: Protection against hacking and malicious attacks on critical infrastructure

## The list goes on...
Energy Storage: Managing surplus energy from renewables and load balancing

Real-time Data: Processing and analyzing vast amounts of data for grid optimization

Demand Response: Adapting to fluctuating demand and enabling user participation in grid management

Aging Infrastructure: Upgrading and maintaining outdated equipment and facilities

Electric Vehicles: Integrating EV charging and potential vehicle-to-grid (V2G) capabilities

Grid Resilience: Ensuring reliability and quick recovery from natural disasters and extreme weather events

Regulatory Challenges: Navigating complex policies and promoting innovation in a heavily regulated industry

# The Solution
# What is it?
Distributed Grid: Decentralized energy management, improved efficiency, enhanced resilience

# How is it coordinated?
Shared Plan9-like Memory: Unified resource access, streamlined data sharing, simplified device interaction

# How is it syncronized?
CRDTs for Synchronization: Conflict-free data, consistent real-time information, accurate decision-making

# How is it standardized?
WebAssembly (Wasm) Runtime: Portable, hardware-agnostic, scalable, high-performance, diverse device support

# What about  hardware control?
Standard System Interface: Firmware feature exposure, optimized performance, seamless integration

# Standardized Hardware-Software Interfaces
To speak a little more to that last point, we've been working on a standard system interface that allows us to expose the features of the hardware to the software. We achive this by means of a custom WASI modules that provided standardized abstractions to firmware instructions much in the same way Linux kenrel modules do. The key diffrence is our moudles are written in Rust and compiled to WebAssembly. This allows us to take advantage of the Wasm runtime and the WASI standard to provide a standardized interface to the hardware. The challenge of course is that each device has unique firmware instructions so every device we wish to support must have a custom library written for it's interface much like the development of device drivers today.

# So far
So far we've implemented CRDT syncronization between our development devices (which are macbooks) and we are currently adding support for more systems.

Adittionally, we have built prototype hardware interfaces enabling basic coordination of tasks like the control of electrical device power consuption (a lamp for example)

We use our value elicition stack to intepret user prfrences, we then form coalations of users based off of shared prefrences utilizing consens to govern device behavior.

# What's next
We are currently working on a prototype of a device that will allow us to control the power consumption of a device plugged into a wall outlet while also running our entire coordination, crypto, and AI stack. We are building onto of the Nividia Jetson Nano which is a small single board computer with a GPU. We are also working on a custom PCB that will allow us to interface with the power outlet and control the power consumption of the device plugged into it. Of all of our development is dedicated to the public domain so people can build ontop of this platform.

# Call to action
So, how can you help? Well as I mentioned all of our work is public so you can check us out on GitHub and contribute to our projects. But more than that what we need is people passionate about this new vision for the grid. The challenges we face are just as much regulatory as they are technical meaning we need people to really push for change in this industry. If you want to get involved or just learn more about what we're doing you can join the discussion on our Signal or Zulip which you can find links to at our website plurigrid.xyz

# Questions
Any?


# Shortened talk outline:
Brief history of computers up to Plan 9 and why it failed and what we can learn.

Overview of modern devices and their impact on the grid.

Problems created by these devices that the grid wasn't designed to address.

Hardware solutions and technical details of hardware-software interfaces.

Progress and future plans.

Call to action.

# Introduction
Hello, my name is Aja Sibley, and I'm an engineer at Plurigrid. Today, I'll discuss the challenges we're addressing in the realm of hardware for modern devices and their impact on the grid.

# History of Computers
A brief history of computing milestones ranging from the Babbage Engine to Plan 9, where distributed computing and resource management took center stage.
Modern Devices and Grid Impact
The grid wasn't designed with computers in mind, let alone modern devices, creating problems such as scalability, intermittency, distributed generation, interoperability, and cybersecurity.

# Hardware Solutions
Plurigrid is developing a distributed grid with shared Plan 9-like memory, CRDTs for synchronization, WebAssembly runtime, and a standard system interface to tackle these challenges.
Standardized Hardware-Software Interfaces
We're working on a standard system interface that exposes hardware features to the software using custom WebAssembly System Interface (WASI) modules written in Rust, providing a standardized interface for diverse devices.

# Progress and Future Plans
We've implemented CRDT synchronization and built prototype hardware interfaces for basic coordination tasks. We're now working on a device that controls power consumption while running our entire coordination, crypto, and AI stack.

# Call to Action
We need passionate people to join our cause, contribute to our public projects on GitHub, and push for change in the industry. Join the discussion on our Signal or Zulip channels, which you can find at plurigrid.xyz.

# Questions
Any?
