Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343E46B8
	for <workflows@vger.kernel.org>; Mon,  2 Jun 2025 23:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748905646; cv=none; b=nle5rkh9Kpio/Lt8iJ8w3yJAhmkvfyZoaPlH3Tpd44gMLMnQ/8CE1byAdsGgPSvhM9hadOJu6BDQiw2/4+8qh12i2ceL61xxEffQqkJCEIg/ehvwg6gwsopnvH/+51yqxocfDZ5DkG0ncNybbkGzMr2d85K+K1wKD1NS/uZgVmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748905646; c=relaxed/simple;
	bh=ynHvcmMSh8WGj1BNZVWIYiXQoejpWcX5OOZcYC13Vi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vhcm+48LJEFK1upAhVBsUFlkmciXEhGsgyioZHVjEMYG6Ic8emFVhVKotbG4jv+o+xvF0TmdAqKHUNFt4rx9ukwUcoK0/X05yGXFyA9MRVhyQhh9WiBIE2oWGwIF8prW4S9AySM2UOxH1qr/Ulaq45Eid/kaXSmaTr7NO/pQ6Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnMaDrs6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnMaDrs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFD7C4CEEB;
	Mon,  2 Jun 2025 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748905645;
	bh=ynHvcmMSh8WGj1BNZVWIYiXQoejpWcX5OOZcYC13Vi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnMaDrs66AOP9V1cC4PTYda3kmRsyDs2h95tvuufexoj2DfsKDfqvUSavKgJgqmNk
	 6Z432pC6RnUHihjz+KWYjdqC3LNzgejTaJ9GJ3GjjB3zacRaFOjGxtaLbQJKmdijdm
	 BDzdZ5aqblt7dgyTAG4XnzNNUp5CkP9Iv4UlVxDQD/ljJ80WfxkEwKiRpoCclUchnd
	 jgGGrNj36HHr9CBibxLtBBennptP1M3IkHWRqbtKXW4qYKe5vCDWAVl0ZREcGziNJu
	 3lBjAxAI2e1cpg/eEJ6k7sdgYpoOw450mWRAphyPKcTs7cdO2dg23ZN+8wfqiUGDaA
	 VZZn9ObHXBOWA==
Date: Mon, 2 Jun 2025 16:07:22 -0700
From: Kees Cook <kees@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: workflows@vger.kernel.org
Subject: Re: Fcc with "git send-email"
Message-ID: <202506021606.A2CFEECE2@keescook>
References: <202505301222.55018E78@keescook>
 <20250603003627.4beb1ae5@foz.lan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603003627.4beb1ae5@foz.lan>

On Tue, Jun 03, 2025 at 12:38:32AM +0200, Mauro Carvalho Chehab wrote:
> the tunnel script redirects the e-mails to dovecot imap daemon:
> 
> 	#!/bin/sh
> 
> 	export MBOX_LOCKS=fcntl
> 	MAIL={my_imap_folder_location}
> 	exec /usr/libexec/dovecot/imap
> 
> With that, the e-mails go to my Drafts folder. This way, I end sending
> the e-mails prepared by git using my MUA. One of the advantages is that
> I can modify the e-mail as needed. I the case of PRs, I use it to add
> a summary of what is there at the PR.

Interesting... this is close, yeah. I end up spawning mutt directly for
my PRs, so I get the FCC. I think there must be a way to get mutt to
send an email noninteractively...

-- 
Kees Cook
