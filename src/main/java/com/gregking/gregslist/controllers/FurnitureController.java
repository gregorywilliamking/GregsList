package com.gregking.gregslist.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gregking.gregslist.models.Furniture;
import com.gregking.gregslist.models.User;
import com.gregking.gregslist.services.FurnitureService;
import com.gregking.gregslist.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class FurnitureController {
	@Autowired
	UserService users;
	@Autowired
	FurnitureService furnitures;

	@GetMapping("/homepage")
	public String homepage(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			model.addAttribute("user", users.getLoggedInUser(userId));
			model.addAttribute("furnitures", furnitures.getAll());
			return "homepage.jsp";
		}
	}

	@GetMapping("/new/furniture")
	public String furnitureForm(@ModelAttribute("furniture") Furniture furniture, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {

			return "furnitureForm.jsp";
		}
	}

	@PostMapping("/create/furniture")
	public String createFurniture(@Valid @ModelAttribute("furniture") Furniture furniture, BindingResult result, Model model,
			HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		if (result.hasErrors()) {
			return "furnitureForm.jsp";
		} else {
			User developer = users.getLoggedInUser(userId);
			furniture.setUser(developer);
			furnitures.createFurniture(furniture);
			return "redirect:/homepage";
		}
	}

	@GetMapping("/view/furniture/{id}")
	public String viewTeam(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			model.addAttribute("furniture", furnitures.getOneFurniture(id));
			return "viewFurniture.jsp";
		}
	}

	@GetMapping("/edit/furniture/{id}")
	public String editForm(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		model.addAttribute("furniture", furnitures.getOneFurniture(id));
		return "editFurniture.jsp";
	}

	@PutMapping("/update/furniture/{id}")
	public String updateFurniture(@Valid @ModelAttribute("furniture") Furniture furniture, BindingResult result, Model model,HttpSession session, RedirectAttributes redirectAttributes) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		else if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("error", "No fields can be blank");
			model.addAttribute("furniture", furniture);
			return "redirect:/edit/furniture/" + furniture.getId();
		}
		else {
			furniture.setUser(users.getLoggedInUser(userId));
			furnitures.update(furniture);
			return "redirect:/homepage";
		}
	}

	@DeleteMapping("/delete/furniture/{furnitureId}")
	public String deleteFurniture(@PathVariable("furnitureId") Long furnitureId, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		furnitures.deleteFurniture(furnitureId);
		return "redirect:/homepage";
	}

}
