Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A521C177;
	Tue,  4 Feb 2025 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698227; cv=none; b=DbP+sqimxEftLBnWv1Za3jiSZtNYPsR3xK0TgudeG57i+wMdB7H4DOWVjCCnhAqRyNa1xZuz939rEJ1tqI8P4asZkivi64vI2CoEP8j+YnU2yDezUPco3gmVnJnDG0PgEXYprKGZLx8MxqloBRvB2C9fYsG7scd/PVJnHyzTQ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698227; c=relaxed/simple;
	bh=k21GbF7hE7CLSX0KqUuyjVd+BHOjQCzOrMF9g2RkbDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anlAYIlqESFrZ4v1zo0tjRcU/H2WR6BhB91Sm38PYsYvhg0p9cojBjXkJj7mprqv1nlLliXh12W7p9W3O4glJmA1JwlVEiOdm9R2mKL/AQXX/S2L220Lc4lHXJR/aSJOMhTkuPLycsykA3Fl08R45c70/zB7SiB8dNm338Yzgmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A8wA2Hzn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A8wA2Hzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB5AC4CEDF;
	Tue,  4 Feb 2025 19:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738698226;
	bh=k21GbF7hE7CLSX0KqUuyjVd+BHOjQCzOrMF9g2RkbDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8wA2HznWYchLk/MCKzMnpxvAXgAetc8lQZHs7oAl0ehW9daIsjn2VNsuHQC1teq/
	 erBuQGvM+OFRWSFgR5wHrTOz2Iujq4PY06WV8jqH0xN3VhDVmHO6vRpekTvqjgOSgp
	 uQIGVpX/jbYTM/kDQIgqIwvZhl183zBGS/fPbUaI=
Date: Tue, 4 Feb 2025 14:43:44 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, corbet@lwn.net, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
Message-ID: <20250204-complex-vengeful-quokka-f7a6c0@meerkat>
References: <20250203174626.1131225-1-kuba@kernel.org>
 <CAMuHMdXXNkpWjkKvMLd-MF=npzqJXMtnXkaba60JY7hCzyjz7g@mail.gmail.com>
 <20250204071834.78e0ffb1@kernel.org>
 <20250204154938.GF22963@pendragon.ideasonboard.com>
 <20250204081301.6fdb1536@kernel.org>
 <4f27a0db-256c-4792-a957-1387de9dc56e@infradead.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f27a0db-256c-4792-a957-1387de9dc56e@infradead.org>

On Tue, Feb 04, 2025 at 10:05:12AM -0800, Randy Dunlap wrote:
> I thought that
> Signed-off-by: John Doe <jdoe@example.com> # Company
> would be acceptable also.
> 
> It looks like that format is documented for Acked-by: but I don't know
> why it is not more generally applicable. I'm pretty sure that I have used it
> a few times. ;)

I'd say that, in general, we should try to keep the person-trailers to be in
the same format as RFC2822 headers, so I have a mild preference towards not
using hash-comments here.

So, I would stick to:

| Signed-off-by: Alex Dev (Company) <adev@example.com>

-K
