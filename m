Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26872DEA8F
	for <workflows@vger.kernel.org>; Wed, 30 Jul 2025 19:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753902677; cv=none; b=XIlCO90pTNzyHksZVa241+pFaLyi7H/ieLvzl8XZWxFdCgjVcwSrcHZep375Ae/tzGgsqTReT8KdDhyi+yr7FCvKP1djWOZYIo3OErMo7HSHP+0nujWalrVz8Q1UK9Gq6KacVOfvYukNAMpr53SLzYw8M6Oyjk8PqehsWv4HX6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753902677; c=relaxed/simple;
	bh=RjESpSgTlZ9Dci+2KNBQWTDiCYqgKjywQQGX5kKRwf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1EZybDul1YvxyNnV4WSu2odQM6pVl4X/5LP+ZhRV+tuReDhZm9D0lzHJNCWLtKCYFKTvD5nraZFpJP/FFuO6DS4NdOpq36miQa3OzJntTnMotnVeTdC5+/T81RLoLaE8EjJjfZ2JxpD9BGcMNMPwGrgcJplB1u/HiER8N86lnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=it9VRzGD; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="it9VRzGD"
Received: from trampoline.thunk.org (pool-173-48-82-136.bstnma.fios.verizon.net [173.48.82.136])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 56UJAXSA023302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 15:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1753902639; bh=UiNk0XW4NYHC10bdELnI4yoPBxOiXLhG3u4btFGZsnQ=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=it9VRzGDvjcXJHIyF1z5i5afP6EBhLyPrM/lTJnPcmGKueLANKUUBKqJ7ku37+XRi
	 Q5inuWG5KNAyD9RacC63YCQ1lpuhK1i7xK/RXeifnPNFYK+dkUxpn3K4Pi1lMDy8Wc
	 nq9nGUls529HS8xoFvUhDdU/ad8ANIarX0Yz6v41QtCyjk3Uh8s7tIRn64CqLF9Gql
	 U/NXe2Cw2GHzMbNpD9yjI9gdcTy4gnvB2ymNdZaVf8dR5UBWbVjIJh3M16zct8hLA9
	 43sJ0n515vaEUVNWqkDfgEy+zOXdMYxGDeS9BeUiiFogHaTvxhGHfjbvQ8GBtOEoYx
	 c2t2RqX2Q9Jbw==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 13F7D2E00D6; Wed, 30 Jul 2025 15:10:33 -0400 (EDT)
Date: Wed, 30 Jul 2025 15:10:33 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Sasha Levin <sashal@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Greg KH <greg@kroah.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org, workflows@vger.kernel.org,
        josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: Re: [PATCH 0/4] Add agent coding assistant configuration to Linux
 kernel
Message-ID: <20250730191033.GA441972@mit.edu>
References: <7e7f485e-93ad-4bc4-9323-f154ce477c39@lucifer.local>
 <2025072854-earthen-velcro-8b32@gregkh>
 <df188552-c2dd-4cb7-9f6a-74e05e677dfc@lucifer.local>
 <20250730112753.17f5af13@gandalf.local.home>
 <158707d7-6729-4bb6-bc72-7556d11bfaef@lucifer.local>
 <20250730121829.0c89228d@gandalf.local.home>
 <aIpKCXrc-k2Dx43x@lappy>
 <20250730130531.4855a38b@gandalf.local.home>
 <aIpah6DTRd99mMqb@lappy>
 <20250730175909.GO222315@ZenIV>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730175909.GO222315@ZenIV>

On Wed, Jul 30, 2025 at 06:59:09PM +0100, Al Viro wrote:
> 
> And I absolutely will refuse to take patches from somebody who would
> consistently fail to explain why the patch is correct and needed.  Sasha,
> this is the elephant in the room: we *ALREADY* get "contributions" that
> very clearly stem from "$TOOL says so, what else do you need?" kind of
> reasoning and some of that dreck ends up in the tree.  AI will serve as
> a force multiplier for those...  persons.
>

Any tool can be a force multipler, either for good or for ill.

For example, I suspect we have a much greater set of problems from
$TOOL's other than Large Language Models.  For example people who use
"git grep strcpy" and send patches (because strcpy is eeeevil), some
of which don't even compile, and some of which are just plain wrong.
Ditto people who take a syzbot reproducer, make some change which
makes the problem go away, and then submit a patch, and only for
maintainers to point ut that the patch introduced bugs and/or really
didn't fix the problem.

I don't think that we should therefore forbid any use of patches
generated using the assistance of "git grep" or syzbot.  That's
because I view this as a problem of the people using the tool, not the
tool itself.  It's just that AI / LLM have been become a Boogeyman
that inspires a lot of fear and loathing.

							- Ted



