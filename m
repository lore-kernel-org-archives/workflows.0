Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD1313E88B;
	Sat, 13 Jul 2024 23:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720913038; cv=none; b=hctoub7PCP5k/OgBWQ+yEwTHLYfVwSl+roP/FpflEs/3lIwknrom6I7wDhQcsptm8jf6GFufq9MLfHp2+AHGWrHaWbg5YLWQ0AUYeph0aVvYjd+3PGDMqwXIzHf3dCc1jJ0FgZtnI0kzdMuy/+z3Li7jQSV3WdCbP/2HBcF8qa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720913038; c=relaxed/simple;
	bh=ityQgdQqfrknym32A92KO3J7icAtNRHb62wGaHf34iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8eXDIRMcCnRMQVGQUBmjhd9t0dOdMdo638POBfaMqZ2MxfcgTgRxPzfP0TueIaDCQRWGlrI5HWRCs/kr6uy7WV5Wtq6K7OnnW6/db+ZCp2t4EMc+oq9W/PozjoQB8xkh+mIrTk098E8fGkF+LKqGH8VqnwPPh9qNLBxc78JDuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4ubhPpZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4ubhPpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4ADC32781;
	Sat, 13 Jul 2024 23:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720913037;
	bh=ityQgdQqfrknym32A92KO3J7icAtNRHb62wGaHf34iQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J4ubhPpZqFiN7Avr6Ua6pW93vUjUJOYNI1vy2MG3gwyF4VmM226CSpR/svOm3HPMR
	 oZAINz5r56zaONAEzMIphJ7NLk8Td4njYEOHuhUCIMW3WofdE+Yi9sHFVeeqNxJ7/b
	 a6fstWJr4U+OMxcTw7gEdAKkffUkouyxNtTINq2CdwjvMIrT+r6jkrVXARotyulSKS
	 MTzHEKGPX9ve2bWNYH2yyHvFzUNTwdCvx8QcS1S5dVcfkEtKKVfcyzrOcBqJiqIJMH
	 VtD1swqc3T2vwBwC4iy3nA7LqneYIi3WeDmicOWWUjeST1F2GGG7Xk7Cv345//uYf3
	 YpZ2rzdgwvJgw==
Date: Sat, 13 Jul 2024 16:23:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240713162356.506ad50f@kernel.org>
In-Reply-To: <20240713142651.GI10946@pendragon.ideasonboard.com>
References: <20240712144903.392284-1-kuba@kernel.org>
	<20240713142651.GI10946@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 13 Jul 2024 17:26:51 +0300 Laurent Pinchart wrote:
> > +Open development
> > +----------------
> > +
> > +Discussions about user reported issues, and development of new code
> > +should be conducted in a manner typical for the larger subsystem.
> > +It is common for development within a single company to be conducted
> > +behind closed doors. However, maintainers must not redirect discussions
> > +and development related to the upstream code from the upstream mailing lists
> > +to closed forums or private conversations. Reasonable exceptions to this
> > +guidance include discussions about security related issues.  
> 
> Overall I think this is fine, but I'm a bit concerned it could be
> interpreted too broadly. Brainstorming on mailing lists is hard, and
> kernel communities often conduct technical discussions face to face, in
> conferences or other events. Sometimes those discussions are as private
> as they can get, I've found myself cycling multiple times to the office
> of a fellow developer who happens to work close to my place in order to
> discuss kernel API design in front of a white board. We did our best to
> publish brainstorming notes on mailing lists, and patches are then of
> course reviewed and further discussed in public. Is this a behaviour you
> want to discourage, or is this considered fine ?

That's fine. 

I hope in the context of the rest of the doc the new section makes
sense. The doc is aimed at less upstream-savvy driver maintainers.
The section before says "you must respond to bug reports" and the
section after says "the person selected as maintainer should be a
developer not a manager".

I hope when reading in that context it is fairly clear that these are
not "rules of Linux". More pointing out where folks more familiar with
corporate environment get tripped up.

I was planning to add this guidance to maintainer-netdev, but folks
pushed back saying that the guidance is generally applicable.

I semi-quoted some example situation we're aiming at here:
https://lore.kernel.org/all/20240712164504.76b15e31@kernel.org/
