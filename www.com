<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>THATHE LIGHTING - Electrical Solutions</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #0d47a1;
            --secondary: #ff9800;
            --dark: #263238;
            --light: #f5f5f5;
            --accent: #4caf50;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            color: var(--dark);
            background-color: var(--light);
            overflow-x: hidden;
        }
        
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        /* Header & Navigation */
        header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
        }
        
        .logo {
            display: flex;
            align-items: center;
        }
        
        .logo h1 {
            color: var(--primary);
            font-size: 1.8rem;
            font-weight: 700;
        }
        
        .logo span {
            color: var(--secondary);
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 2rem;
        }
        
        nav ul li a {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            transition: color 0.3s;
            position: relative;
        }
        
        nav ul li a:hover {
            color: var(--primary);
        }
        
        nav ul li a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -5px;
            left: 0;
            background-color: var(--primary);
            transition: width 0.3s;
        }
        
        nav ul li a:hover::after {
            width: 100%;
        }
        
        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: var(--primary);
        }
        
        /* Hero Section */
        .hero {
            height: 100vh;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1509391366360-2e959784a276?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1472&q=80') center/cover no-repeat;
            display: flex;
            align-items: center;
            text-align: center;
            color: white;
            margin-top: 80px;
        }
        
        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }
        
        .btn {
            display: inline-block;
            background: var(--secondary);
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
            border: 2px solid var(--secondary);
        }
        
        .btn:hover {
            background: transparent;
            color: var(--secondary);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        
        .btn-secondary {
            background: transparent;
            border: 2px solid white;
            margin-left: 1rem;
        }
        
        .btn-secondary:hover {
            background: white;
            color: var(--dark);
        }
        
        /* Services Section */
        .section {
            padding: 6rem 0;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 4rem;
        }
        
        .section-title h2 {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }
        
        .section-title h2::after {
            content: '';
            position: absolute;
            width: 70px;
            height: 4px;
            background: var(--secondary);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .section-title p {
            color: #666;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        
        .service-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        .service-card:hover {
            transform: translateY(-10px);
        }
        
        .service-img {
            height: 200px;
            overflow: hidden;
        }
        
        .service-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .service-card:hover .service-img img {
            transform: scale(1.1);
        }
        
        .service-content {
            padding: 1.5rem;
        }
        
        .service-content h3 {
            font-size: 1.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }
        
        .service-content p {
            color: #666;
            margin-bottom: 1.5rem;
        }
        
        /* About Section */
        .about {
            background: linear-gradient(to right, white 50%, var(--primary) 50%);
        }
        
        .about-container {
            display: flex;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .about-content {
            flex: 1;
            padding: 3rem;
        }
        
        .about-image {
            flex: 1;
            background: url('https://images.unsplash.com/photo-1596727147705-61a532a659bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80') center/cover no-repeat;
        }
        
        .about-content h2 {
            color: var(--primary);
            font-size: 2rem;
            margin-bottom: 1.5rem;
        }
        
        .about-content p {
            margin-bottom: 1.5rem;
            color: #555;
        }
        
        .owner-info {
            display: flex;
            align-items: center;
            margin-top: 2rem;
            border-left: 4px solid var(--secondary);
            padding-left: 1rem;
        }
        
        /* Contact Section */
        .contact {
            background: var(--dark);
            color: white;
        }
        
        .contact-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 3rem;
        }
        
        .contact-info h3 {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--secondary);
        }
        
        .contact-info p {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }
        
        .contact-info i {
            color: var(--secondary);
            margin-right: 1rem;
            font-size: 1.2rem;
        }
        
        .contact-form .form-group {
            margin-bottom: 1.5rem;
        }
        
        .contact-form input,
        .contact-form textarea,
        .contact-form select {
            width: 100%;
            padding: 0.8rem;
            border: none;
            border-radius: 5px;
            background: rgba(255,255,255,0.1);
            color: white;
            font-family: 'Poppins', sans-serif;
        }
        
        .contact-form textarea {
            height: 150px;
            resize: vertical;
        }
        
        .contact-form input:focus,
        .contact-form textarea:focus,
        .contact-form select:focus {
            outline: 2px solid var(--secondary);
            background: rgba(255,255,255,0.2);
        }
        
        .contact-form .btn {
            background: var(--secondary);
            border: none;
            cursor: pointer;
            width: 100%;
        }
        
        /* Gallery Section */
        .gallery {
            background-color: #f9f9f9;
        }
        
        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
        }
        
        .gallery-item {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
            height: 250px;
        }
        
        .gallery-item:hover {
            transform: scale(1.05);
        }
        
        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        /* Testimonials */
        .testimonials {
            background: linear-gradient(to right, var(--primary) 50%, white 50%);
        }
        
        .testimonials-container {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 3rem;
        }
        
        .testimonial {
            text-align: center;
            padding: 1.5rem;
        }
        
        .testimonial-content {
            font-style: italic;
            margin-bottom: 1.5rem;
            color: #555;
            position: relative;
        }
        
        .testimonial-content::before,
        .testimonial-content::after {
            content: '"';
            font-size: 3rem;
            color: var(--secondary);
            opacity: 0.3;
            position: absolute;
        }
        
        .testimonial-content::before {
            top: -20px;
            left: -10px;
        }
        
        .testimonial-content::after {
            bottom: -40px;
            right: -10px;
        }
        
        .testimonial-author {
            font-weight: 600;
            color: var(--primary);
        }
        
        /* Footer */
        footer {
            background: #111;
            color: #aaa;
            padding: 2rem 0;
            text-align: center;
        }
        
        .footer-content {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .social-icons {
            margin: 1rem 0;
        }
        
        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
            color: white;
            margin: 0 0.5rem;
            transition: all 0.3s;
        }
        
        .social-icons a:hover {
            background: var(--secondary);
            transform: translateY(-5px);
        }
        
        /* Responsive Design */
        @media (max-width: 992px) {
            .hero h1 {
                font-size: 3rem;
            }
            
            .about-container {
                flex-direction: column;
            }
            
            .about-image {
                height: 400px;
            }
        }
        
        @media (max-width: 768px) {
            nav ul {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                width: 100%;
                background: white;
                flex-direction: column;
                padding: 1rem 0;
                box-shadow: 0 5px 10px rgba(0,0,0,0.1);
            }
            
            nav ul.show {
                display: flex;
            }
            
            nav ul li {
                margin: 1rem 0;
                text-align: center;
            }
            
            .mobile-menu-btn {
                display: block;
            }
            
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .hero p {
                font-size: 1rem;
            }
            
            .btn {
                display: block;
                margin: 1rem auto;
                width: 80%;
                max-width: 300px;
            }
            
            .btn-secondary {
                margin-left: 0;
            }
        }
        
        @media (max-width: 576px) {
            .hero h1 {
                font-size: 2rem;
            }
            
            .section-title h2 {
                font-size: 2rem;
            }
            
            .about-content {
                padding: 2rem 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header & Navigation -->
    <header>
        <div class="container header-container">
            <div class="logo">
                <h1>THATHE <span>LIGHTING</span></h1>
            </div>
            <button class="mobile-menu-btn" id="menuBtn">
                <i class="fas fa-bars"></i>
            </button>
            <nav>
                <ul id="navMenu">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#services">Services</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#gallery">Gallery</a></li>
                    <li><a href="#testimonials">Testimonials</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-content">
            <h1>Professional Electrical Solutions</h1>
            <p>Supplying quality electrical appliances, expert lighting installations, and sustainable solar energy solutions for homes and businesses across South Africa.</p>
            <a href="#contact" class="btn">Get a Quote</a>
            <a href="#services" class="btn btn-secondary">Our Services</a>
        </div>
    </section>

    <!-- Services Section -->
    <section class="section" id="services">
        <div class="container">
            <div class="section-title">
                <h2>Our Services</h2>
                <p>Comprehensive electrical solutions tailored to meet your specific needs</p>
            </div>
            
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-img">
                        <img src="https://images.unsplash.com/photo-1596727147705-61a532a659bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80" alt="Electrical Appliances">
                    </div>
                    <div class="service-content">
                        <h3>Electrical Appliance Supply</h3>
                        <p>We offer a wide range of high-quality electrical appliances including refrigerators, stoves, washing machines, and more from trusted brands at competitive prices.</p>
                        <a href="#contact" class="btn">Inquire Now</a>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="https://images.unsplash.com/photo-1531310197839-ccf54634509e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1365&q=80" alt="Lighting Installation">
                    </div>
                    <div class="service-content">
                        <h3>Lighting Installation</h3>
                        <p>Professional installation of indoor, outdoor, and decorative lighting solutions to enhance your space while ensuring safety and energy efficiency.</p>
                        <a href="#contact" class="btn">Get Lighting</a>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-img">
                        <img src="https://images.unsplash.com/photo-1509391366360-2e959784a276?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1472&q=80" alt="Solar Panels">
                    </div>
                    <div class="service-content">
                        <h3>Solar Panel Installation</h3>
                        <p>Eco-friendly solar solutions for homes and businesses. Reduce your electricity bills and carbon footprint with our professional solar installations.</p>
                        <a href="#contact" class="btn">Go Solar</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="section about" id="about">
        <div class="container">
            <div class="about-container">
                <div class="about-content">
                    <h2>About THATHE LIGHTING</h2>
                    <p>Founded by Hangwelani Netshidzivhe, THATHE LIGHTING has been providing top-quality electrical solutions to the South African community for over 10 years. We take pride in our commitment to excellence, safety, and customer satisfaction.</p>
                    <p>Our team of certified electricians and technicians are trained to handle projects of all sizes, from residential lighting installations to commercial solar energy systems. We use only the highest quality materials and adhere to strict safety standards.</p>
                    <p>At THATHE LIGHTING, we believe in sustainable energy solutions that benefit both our customers and the environment. Our solar division helps reduce carbon footprints while providing significant cost savings on electricity bills.</p>
                    
                    <div class="owner-info">
                        <div>
                            <h4>Hangwelani Netshidzivhe</h4>
                            <p>Founder & CEO</p>
                        </div>
                    </div>
                </div>
                <div class="about-image"></div>
            </div>
        </div>
    </section>

    <!-- Gallery Section -->
    <section class="section gallery" id="gallery">
        <div class="container">
            <div class="section-title">
                <h2>Our Work</h2>
                <p>Explore our recent projects and installations</p>
            </div>
            
            <div class="gallery-gria
