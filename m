Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6553132124;
	Sat, 13 Jul 2024 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720880436; cv=none; b=ai70SX+ZC4cqNnvofT661uuxkokh6Cep2vfzyKNtME+ZhiB9WeLEwMFC7aanX0s981G08+xeLAZCQ4FXuF5JlzEbiCMLrF0ey7l7qYF/gw5/cYU7voXqaKYC2GcDgF+Q46RdqWNJe4CmEOedXCMjDhAy1NmSvexC0bmGD9EUA48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720880436; c=relaxed/simple;
	bh=MV1LE+gEM5jAmCSFiG6pYqFbNQTxPzb54G31jC+PyYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWvZUGkBcmUom+lRrOpAFtzY9UUCDjbnMcdmEVRFbyWcIpe5yFiTjgC2fm/6/bd9heqxbmg5jzkyRBODTT4WnIFbXpF1yv2owlwHUpZ9jj4Vwh94pX0u1RbGcecWY9OBirajZa1eq7HQIHT2g/0Mesr/ycrrH+7WHL30Q0yyg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k7Ltl1bh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k7Ltl1bh"
Received: from pendragon.ideasonboard.com (unknown [185.201.63.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CDC1CDB;
	Sat, 13 Jul 2024 16:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720880391;
	bh=MV1LE+gEM5jAmCSFiG6pYqFbNQTxPzb54G31jC+PyYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7Ltl1bh83uOnWgvsloTlj8Y7AAOU65jO/9Kucz6IMUcj0WyKRRJJ5sKqqm8T/3yd
	 eJ6AHGqvyKRQwhGJ8VjcX0HlDtKWS7jhNgkn23FcsQ98A4/byZYXDCmR7NeU5Rutjn
	 /m7o1akB80rLd9RZPfOUovhHzXJ4UrdCIozNvaZo=
Date: Sat, 13 Jul 2024 17:19:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240713141956.GH10946@pendragon.ideasonboard.com>
References: <20240712144903.392284-1-kuba@kernel.org>
 <669179424b589_1a77429479@dwillia2-xfh.jf.intel.com.notmuch>
 <20240712170558.50c89238@kernel.org>
 <20240713101328.72734cb0@foz.lan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240713101328.72734cb0@foz.lan>

On Sat, Jul 13, 2024 at 10:13:28AM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 12 Jul 2024 17:05:58 -0700 Jakub Kicinski escreveu:
> > On Fri, 12 Jul 2024 11:43:14 -0700 Dan Williams wrote:
> > > This reads as a vague ambiguous quasi-threat with no actionable way to
> > > enforce it. In contrast, successful maintainers already have a sense of
> > > the benefits of pushing discussions to the list as much as possible.
> > > 
> > > For new and growing maintainers, which I assume are the audience for
> > > this guidance, that are unaware of the pitfalls of taking conversations
> > > off-list, they likely need help understanding the *benefits* of open
> > > development.  
> > 
> > I don't think so. If your boss comes to you and says "Dan, from now on
> > try not to reply to customers on the list, open a ticket first and only
> > reply once tickets is resolved". Is it more useful to you to be able to
> > extol the benefits of open source process; or to tell them "this is not
> > allowed, here's a link to a quasi-threat"?
> 
> No matter what you write, between your text and their boss's directive,
> I bet the latter will be a lot more effective.

I don't agree with this. I have found clear written rules valuable
personally when discussing with management. Being able to point to
upstream policies and tell "this is not allowed" helped change internal
processes. It will obviously not have a 100% success rate, but it's not
useless.

> > > So if this goes in as is, so be it, but it feels like a missed
> > > opportunity to extoll the virtues of open development. The benefits are
> > > in the same vector as the "release early, release often" guidance where
> > > the urge to polish a solution in private is a common trait of newcomers.
> > > Lets document some tribal knowledge of how one moves past that first
> > > instinct.  
> > 
> > Hm, the disconnect may be that you think this happens with maintainers
> > without upstream experience. So we can train them up to be better.
> 
> No, that's the case where you can still "fix" maintainer's behaviors.
> 
> > In most cases it happens to folks with experience who are good
> > maintainers. They just get 2 orders of magnitudes more patches from
> > inside the company that outside. Then a contribution comes from outside,
> > the maintainer is overworked, and tries to shoehorn the patch into the
> > existing, internal-only process.
> 
> It seems unavoidable that internal patches have higher priorities even
> if the maintainer is not overloaded.
> 
> Even on a perfect world, the degree of confidence on internal patches is 
> usually orders of magnitude higher, as internal devs have access to internal
> product documentation, future line of products that will re-use the same
> driver and, on larger projects, will also be already tested by internal
> CI-based regression tests.
> 
> The external patches won't have that, so they need to be reviewed by
> an internal developer, checked against internal docs and then submitted to 
> the company's internal CI regression test infra to achieve the same degree
> of confidence.

We don't seem to live in the same (perfect or imperfect) world. In my
experience, contributions from external kernel developers are often
better than patches originating from within a company. External
contributors are more used to follow proper upstream review processes.

> That not to mention that company will almost always prioritize new
> product support over maintaining existing products.
> 
> No do/don't kind of document will change that.
> 
> A change like that should come top/down, so it has to be addressed 
> via other strategies, like documents underlining the benefits of 
> upstream first, and tutorials/speeches aimed at companies management
> staff.

-- 
Regards,

Laurent Pinchart
