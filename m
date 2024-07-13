Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F92226296;
	Sat, 13 Jul 2024 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720858414; cv=none; b=Vp+b5KNXwwB3XEzCfM3aBYWh6QHA2WoTaClGfa4CnlbveWOU4vGZxT0rBZBT6iY8gD4mt8srXrjBel4FaH9HOvCQPENzcji9oQ154Smx+2cuXZzNsXzT1Bq+V178nDEAE7ocsu3p9SPikvhX6mrDHLQu0lcEblTCjIO8PY7vzM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720858414; c=relaxed/simple;
	bh=mgH16hqXeg48i3AOxOMTjtG9NDHZmU8k0VQpM/sTsu0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjA2DN4d+3gPf68Jme27aJYlPqiqz5/w+USBeoMq4HVVdHBng7ttoSdZ0HCPG5awxYNuhXtSKwHqyRrcQwyd6n5zKQ1A+/FPi8besXG5Sj0W06BG0Y7Ji+3bXawZ+8atXcsxwvDXaylVWwLgzL6SxLaYfYTtvpKVgkLAJcplJ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXnSWXyA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXnSWXyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A389C32781;
	Sat, 13 Jul 2024 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720858413;
	bh=mgH16hqXeg48i3AOxOMTjtG9NDHZmU8k0VQpM/sTsu0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IXnSWXyAw6qm5PiuNEskO6a8I+wfjg6ewL28ljkvU7DMvQHqv09D4v+xOumlik8AK
	 zSk2HuZCrmcPghZFsDaet/5Fex2HQunetdXa2QxNh3osRoF4phCXQ4nwA30J2a9zyo
	 VT7+5FmE6S7TwC7qZgIdlW5btBwQ03WLjAY8a8m+YSF2/Z87EjZr5pcQbiPsp6CUSj
	 vltLI+N6oCV3orY6GI8pEit9t/hvBOeKWmvTI08tD+GruFBAjMZ5Yk40aHe91AZfRC
	 g7z67oGzebXe7VsCQBcPj9mBRu40PbhRcsTWVIfRwuVNzMhNpDlXCVXAbINXaeVi61
	 lG3+R9GPE8exw==
Date: Sat, 13 Jul 2024 10:13:28 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>, <corbet@lwn.net>,
 <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240713101328.72734cb0@foz.lan>
In-Reply-To: <20240712170558.50c89238@kernel.org>
References: <20240712144903.392284-1-kuba@kernel.org>
	<669179424b589_1a77429479@dwillia2-xfh.jf.intel.com.notmuch>
	<20240712170558.50c89238@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 12 Jul 2024 17:05:58 -0700
Jakub Kicinski <kuba@kernel.org> escreveu:

> On Fri, 12 Jul 2024 11:43:14 -0700 Dan Williams wrote:
> > This reads as a vague ambiguous quasi-threat with no actionable way to
> > enforce it. In contrast, successful maintainers already have a sense of
> > the benefits of pushing discussions to the list as much as possible.
> > 
> > For new and growing maintainers, which I assume are the audience for
> > this guidance, that are unaware of the pitfalls of taking conversations
> > off-list, they likely need help understanding the *benefits* of open
> > development.  
> 
> I don't think so. If your boss comes to you and says "Dan, from now on
> try not to reply to customers on the list, open a ticket first and only
> reply once tickets is resolved". Is it more useful to you to be able to
> extol the benefits of open source process; or to tell them "this is not
> allowed, here's a link to a quasi-threat"?

No matter what you write, between your text and their boss's directive,
I bet the latter will be a lot more effective.

> > So if this goes in as is, so be it, but it feels like a missed
> > opportunity to extoll the virtues of open development. The benefits are
> > in the same vector as the "release early, release often" guidance where
> > the urge to polish a solution in private is a common trait of newcomers.
> > Lets document some tribal knowledge of how one moves past that first
> > instinct.  
> 
> Hm, the disconnect may be that you think this happens with maintainers
> without upstream experience. So we can train them up to be better.

No, that's the case where you can still "fix" maintainer's behaviors.

> In most cases it happens to folks with experience who are good
> maintainers. They just get 2 orders of magnitudes more patches from
> inside the company that outside. Then a contribution comes from outside,
> the maintainer is overworked, and tries to shoehorn the patch into the
> existing, internal-only process.

It seems unavoidable that internal patches have higher priorities even
if the maintainer is not overloaded.

Even on a perfect world, the degree of confidence on internal patches is 
usually orders of magnitude higher, as internal devs have access to internal
product documentation, future line of products that will re-use the same
driver and, on larger projects, will also be already tested by internal
CI-based regression tests.

The external patches won't have that, so they need to be reviewed by
an internal developer, checked against internal docs and then submitted to 
the company's internal CI regression test infra to achieve the same degree
of confidence.

That not to mention that company will almost always prioritize new
product support over maintaining existing products.

No do/don't kind of document will change that.

A change like that should come top/down, so it has to be addressed 
via other strategies, like documents underlining the benefits of 
upstream first, and tutorials/speeches aimed at companies management
staff.

Thanks,
Mauro
