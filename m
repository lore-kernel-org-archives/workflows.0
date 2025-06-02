Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FDC288CC
	for <workflows@vger.kernel.org>; Mon,  2 Jun 2025 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748903917; cv=none; b=kBy7qxiBfqOw/AQ6WL58i98XOboQlcl0fjcik5j+GP3R2y/mLuLhazOgPH3cHfhbazaskcnHebfVb/l8LF251W6g/eULYCNLJakGApdoMw1/t/XtBUQyGfVdsMnkoeehpE6ei59CwUt0gI86eykbe4emOAG8gKee4yWYfC9tbIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748903917; c=relaxed/simple;
	bh=+jwsnZ8wvvsejJxwVsCTloimwKtV2q0eJ1vOG/UBWSE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KR+rWqVgL+M6OKttfmLipwIh/PkF4yO0SPj6YMOmoSye8OnNWmlwk3xaqA2Sg07sdKIxvBTVOuwFIp2sJnvMFJ6w1DbrGGUmyDa104DEbIj/nGfhx/aF1zBuNj5ydggKiY4MrSfvSvgNcHuTCXm14UMS2Ox/Fapq4gsPah7NCQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4RHc5Zq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4RHc5Zq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD59C4CEEB;
	Mon,  2 Jun 2025 22:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748903916;
	bh=+jwsnZ8wvvsejJxwVsCTloimwKtV2q0eJ1vOG/UBWSE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L4RHc5ZqwtC6hmR4tZoahNCPMiccjlGQHOc4UqckXj6915ZkZCF8YHxqtxnCyO1ay
	 eYu7Dpz3czyRrRc0ZdfC2oGAYetDfTw83/QDuXJrleS5w5yE3z12UlaITc+K5QWCeO
	 rnpjtSsZI5q7DMuEtgyKv688J1vzpc4mscaytURHX/u10IGFHAA1tykkYEa3Th9mol
	 rq0UmLV0pxWkQHX+jlQHORz8l4dvNjG9CNmWDV6F6uQvOBUwyIecw7kb8tC+HoNtKK
	 vOQOD4okZ9QZBEE5nknymoPmRYJnxmdq0uH2RvDa2sLi2vmYZDOlHvMBBuKFABun/2
	 XjODksNp1srvQ==
Date: Tue, 3 Jun 2025 00:38:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: workflows@vger.kernel.org
Subject: Re: Fcc with "git send-email"
Message-ID: <20250603003627.4beb1ae5@foz.lan>
In-Reply-To: <202505301222.55018E78@keescook>
References: <202505301222.55018E78@keescook>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 30 May 2025 12:32:04 -0700
Kees Cook <kees@kernel.org> escreveu:

> Hi,
> 
> I'm just curious if anyone has found a workable solution for getting
> "Sent" folder copies of emails sent with "git send-email" (or similar
> tools that throw everything into "sendmail -i"). I'd really like my
> patches to show up in my "Sent" IMAP folder, but I only get this if I
> use my MUA directly (in my case, mutt).
> 
> I'm thinking it might be possible set git's --sendmail-cmd= to a script
> that wraps "mutt -H ..." or "mutt -x ..." but I'm not having much luck.
> 
> Has anyone else done this?

I don't do this for normal patches, but I do it on my upstream PR.

After preparing the PR e-mail with:

	git request-pull {self.origin} git://{self.tree} {self.tag}
	(you can use git format-email instead for patch series)

I use:

	git imap-send

On my .git/config, I have:

[imap]
        tunnel = {my_home_dir}/bin/dovecot-imap.sh
        folder = Drafts

the tunnel script redirects the e-mails to dovecot imap daemon:

	#!/bin/sh

	export MBOX_LOCKS=fcntl
	MAIL={my_imap_folder_location}
	exec /usr/libexec/dovecot/imap

With that, the e-mails go to my Drafts folder. This way, I end sending
the e-mails prepared by git using my MUA. One of the advantages is that
I can modify the e-mail as needed. I the case of PRs, I use it to add
a summary of what is there at the PR.

Thanks,
Mauro
