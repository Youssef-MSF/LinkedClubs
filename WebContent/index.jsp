<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="CSS/styles.css" />
    <title>LinkedClubs</title>
</head>

<body>
    <header class="shadow-xl">
        <nav class="flex lg:justify-between justify-center flex-wrap p-2">
            <a href="#" class="px-10 py-6 text-3xl font-black text-gray-700">LinkedClubs</a>
            <ul class="px-10 md:py-6">
                <li class="inline-block pr-3">
                    <a href="#">
                        <img src="/LinkedClubs/Images/appsclub.jpeg"
                            class="rounded-full transition transform duration-500 hover:rotate-180 w-10 h-10" />
                    </a>
                </li>
                <li class="inline-block pr-3">
                    <a href="#">
                        <img src="/LinkedClubs/Images/clubsocial.jpeg"
                            class="rounded-full transition transform duration-500 hover:rotate-180 w-10 h-10" />
                    </a>
                </li>
                <li class="inline-block pr-3">
                    <a href="#">
                        <img src="/LinkedClubs/Images/sportif.jpeg"
                            class="rounded-full transition transform duration-500 hover:rotate-180 w-10 h-10" />
                    </a>
                </li>
                <li class="inline-block pr-3">
                    <a href="#">
                        <img src="/LinkedClubs/Images/enactus.jpeg"
                            class="rounded-full transition transform duration-500 hover:rotate-180 w-10 h-10" />
                    </a>
                </li>
            </ul>
        </nav>
    </header>
    <main class="container m-auto">
        <h1 class="text-4xl font-bold lg:mx-6 mt-10 my-6 px-4 my-6 text-gray-500">Matching Students <br> with great
            Clubs.</h1>
        <div class="flex flex-wrap">
            <section class="m-10">
                <h2 class="text-xl font-bold text-gray-700">For Students</h2>
                <p class="text-gray-500 py-6 mb-6">We are the market–leading technical <br> interview platform to <br>
                    identify and hire
                    developers</p>
                <a href="/LinkedClubs/Login" class="py-6 px-16 font-bold my-6 text-center main-bg-color shadow-lg text-white">Log in</a>
            </section>
            <section class="m-10">
                <h2 class="text-xl font-bold text-gray-700">For Clubs</h2>
                <p class="text-gray-500 py-6 mb-6">Join over 11 million developers, practice <br> coding skills, prepare
                    for
                    interviews,
                    <br /> and get
                    hired.
                </p>
                <a href="/LinkedClubs/Signup" class="py-6 px-16 font-bold text-center shadow-lg border-2 main-border-color main-color">Sign
                    up</a>
            </section>
        </div>
    </main>
    <aside class="flex justify-end absolute right-0 top-32 hidden">
        <img src="appsclub.jpeg" />
    </aside>
    <footer class="p-10 mt-6 text-gray-500">
        <p class="text-center">LinkedClubs Copyright &copy; 2021 open sourced on <a href="">LinkedClubs</a>
        </p>
    </footer>
</body>

</html>