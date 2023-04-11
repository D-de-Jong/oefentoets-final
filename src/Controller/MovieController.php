<?php

namespace App\Controller;
use App\Entity\Genre;
use App\Entity\Movie;
use App\Entity\TopActor;
use App\Form\AddGenreType;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class MovieController extends AbstractController
{
    #[Route("/", name: "home")]
    public function showHome(EntityManagerInterface $entityManager): Response
    {
        $genres = $entityManager->getRepository(Genre::class)->findAll();
        return $this->render("home.html.twig", ['genres' => $genres]);

    }

    #[Route("/movies/{id}", name: "movies")]
    public function showPizzas(EntityManagerInterface $entityManager, int $id): Response
    {
        $genre = $entityManager->getRepository(Genre::class)->find($id);
        return $this->render("movies.html.twig", [
            'genre' => $genre
        ]);
    }


    #[Route('/AddGenre', name: 'addGenre')]
    public function Order(Request $request, EntityManagerInterface $em): Response
    {
        $genre = $em->getRepository(Genre::class)->findAll();
        $add = new Genre();
        $form = $this->createForm(AddGenreType::class, $add);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $add = $form->getData();
            $em->persist($add);
            $em->flush();

        }

        return $this->renderForm('genre.html.twig', [
            'controller_name' => 'MovieController',
            'form' => $form

        ]);
    }


}