Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270442054F8;
	Tue,  4 Feb 2025 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697624; cv=none; b=TnRKCckHCpFY3aB2BjR6hrhUttFJL7WCrvV1CaoyJntukJBpu+GtW09kwnvZ8wp6anpYqGW/IlinUdbgqEs3X39MH45G+AD6jOlcJgNXF2+tw68oWyHnNPt1T1/Hrzdo47XPzNnybQ6ts3x/oi6D6yBHCXAe2N++QfWwifg3uuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697624; c=relaxed/simple;
	bh=cI6tArg9xnQZvvop6jaImaCFJAtTHE9f79/vvAAmVjA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B9tFPM+l8PHWMHu3LitXdFC0nDlm8D9vAbNx3nGKi5Gk4WS8/RZC0ymjoinENuUShfsYced419XuueI7Es8X452RdcEGlrv3uXIQROuFU6DFl5HgEqFCAXT6f/cG6HhIrfRvyfW0rN2+lZU4O4CIl8pwTS94oOuak0YMq6pBnRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNHRty/m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNHRty/m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33051C4CEE7;
	Tue,  4 Feb 2025 19:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697623;
	bh=cI6tArg9xnQZvvop6jaImaCFJAtTHE9f79/vvAAmVjA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kNHRty/mLuC5vVFaL08ZS1S02lHDuP9m/ct5OMUToBMuBggDpltU+0a9I6O2VanD8
	 2/sHbqq1iQBb+s+ftq5qUBcQXABrIXEfIKBNYXmIytB8LCYOYrC+UHrOwzdrhObCFv
	 ynHSDDnywUJ8I7cOdMvl/zKYZbs6VA04F0GdKxh5efkme3enme4QNywMnvCu/P5pQy
	 QJuU4HK4CT5uBuIp5A28pkM00meWna5w81w7o2LgGWaNVXw99Vw5i31fvp6rrb7LQk
	 96hZtHfTCPTvgDTvtYFxiIoYVREtD9LmJnaCCKQlGPj4KZIgpYzU/k0MtmgU9fYG7E
	 p2bWgpSU8azJw==
Date: Tue, 4 Feb 2025 11:33:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
Message-ID: <20250204113342.3b8f18f8@kernel.org>
In-Reply-To: <4f27a0db-256c-4792-a957-1387de9dc56e@infradead.org>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Feb 2025 10:05:12 -0800 Randy Dunlap wrote:
> Signed-off-by: John Doe <jdoe@example.com> # Company

Interesting :)

On a quick look this seems to be the format of choice for maintainers
who edit patches:

Signed-off-by: Mr Maintainer <jdoe@example.com> # fixed xyz

I don't see a single # use in the From lines. I think the # formatting
is well suited for free form comments. Less so for things which may need
to be machine readable (for development statistics).
