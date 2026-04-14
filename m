Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11DD242D7F;
	Tue, 14 Apr 2026 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776177127; cv=none; b=WdddHxPdwLQbsA4AlA02lQb0/qSEd5qSQKlbPzOLlXqPex4uiqN++O26Nj2sa3sYiVnLqlgszycojRdljA9OcFbRo9XY6Q9Kl52lipgK0OWLnZmLUI7cbIhj3E5proDtA6rc6WddQb9ZwpdVvoXquxeODx0s6X0hIG57VEVzKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776177127; c=relaxed/simple;
	bh=CWiwP2oLTWZNL6Cb5yxV4OsPnRAOlljsQx6OoE4qiBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cy0I9gtbzTuKHGIn2j4owpVwitsvREc4V7XJg2DIG1YihNOkntJ4lKVbddTuOqHa+WlRGsFl7ZPMa7X+d6I75m/NOCaMCruhOe9gWTx7WecGgPbjtcJk08BYjzXlWhHODVwk1y48mYEgOz6ZYZ3Ol7LAjIaOhm8d2TpKbSATJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukCTjwbT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukCTjwbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5729FC2BCB9;
	Tue, 14 Apr 2026 14:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776177127;
	bh=CWiwP2oLTWZNL6Cb5yxV4OsPnRAOlljsQx6OoE4qiBQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ukCTjwbTaWFhUisMbRu28tNXKa+yQoSrxyoDSEzpp0W9HqeAuF7HAYsbAFHQ90l7z
	 /pS7Qz4rKcaty0TZeI1nP71ZHalPp6DKR5ogFCV1gx5CiGdU8gtOano5nkd0pJWmr/
	 tAkOeuzRKuoo/HC4ZaK/ZwIEYUA5l2Ia6vCSBpx53QxocE/qH8CAuU3P1MSoEw3/99
	 JuiCIN1K5X4CnBROHvjS1ShbIGyiTfYxdie4oxKqBZfQyjvD6hYW4u1Z4jxzjiH/4r
	 MrYTM9Ilb8cohpHjAldcnL5+YDjFxfiWepBUCFG8jAuR0NSxw6GDXHn6CfnSQjYUPq
	 RRYv3i4Q5mrMw==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCeo9-00000007omM-0Rz2;
	Tue, 14 Apr 2026 16:32:05 +0200
Date: Tue, 14 Apr 2026 16:32:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Dan Williams <djbw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Documentation <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Kernel Workflows
 <workflows@vger.kernel.org>
Subject: Re: maintainer profiles
Message-ID: <20260414163204.08f94002@localhost>
In-Reply-To: <20260414143733.6cbd6d62@localhost>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
	<87wlyawum7.fsf@trenco.lwn.net>
	<69dd6299440be_147c801005b@djbw-dev.notmuch>
	<20260414143733.6cbd6d62@localhost>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Apr 2026 14:37:33 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Mon, 13 Apr 2026 14:39:37 -0700
> Dan Williams <djbw@kernel.org> wrote:
> 
> > Jonathan Corbet wrote:  
> > > Randy Dunlap <rdunlap@infradead.org> writes:
> > >     
> > > > Hi,
> > > >
> > > > Is there supposed to be a difference (or distinction) in the contents of
> > > >
> > > > Documentation/process/maintainer-handbooks.rst
> > > > and
> > > > Documentation/maintainer/maintainer-entry-profile.rst
> > > > ?
> > > >
> > > > Can they be combined into one location?    
> > > 
> > > Late to the party, sorry ... the original idea, I believe, was that
> > > maintainer-handbooks.rst would be for developers looking for a guidebook
> > > for a specific subsystem, while maintainer-entry-profile.rst was about
> > > how maintainers themselves should write their subsystem guide.
> > > Doubtless things have drifted since then...  But the intended audiences
> > > were different, so it might be good to think about bringing them back
> > > into focus.    
> > 
> > Right, I think something (roughly / hand-wavy) like the below is the
> > intent. However, as I write that I notice that the combined list is a
> > bit of a mess. I also notice that there are more "P:" entries in
> > MAINTAINERS than there are entries in this maintainer-handbooks.rst
> > list.
> > 
> > So this probably wants to be a script that can build Documentation links
> > from MAINTAINERS, or otherwise provide a script for developers to query
> > a kernel tree for additional submission guides. It is probably not as
> > important for the built docs to link all guides as it is for developers
> > (or their agents) to live query a tree they are developing against.  
> 
> There is already a Python script which parses MAINTAINERS file
> (Documentation/sphinx/maintainers_include.py).
> 
> Currently, it expects a Sphinx meta-tag inside
> Documentation/process/maintainers.rst:
> 
> 	.. maintainers-include::
> 
> I guess it shouldn't be hard to add support there for a
> 
> 	.. maintainers-profile::
> 
> Making it creating a set of cross-references is probably easy. Not
> sure how easy/hard would be to create a TOC tree, though.

It was actually easier than what I would expect ;-)

Just submitted a patch series doing that:

https://lore.kernel.org/linux-doc/cover.1776176108.git.mchehab+huawei@kernel.org/T/#t

> > diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
> > index 6020d188e13d..58e2af333692 100644

...

If you transform this diff into a patch, it would make sense to
add together with the next version of my RFC ;-)

-- 
Thanks,
Mauro
