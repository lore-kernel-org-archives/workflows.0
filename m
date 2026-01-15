Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B879A30DED0
	for <workflows@vger.kernel.org>; Thu, 15 Jan 2026 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461766; cv=none; b=ksYINJsEUTKBrBLspr4K5qq53+nv0A611V7MPkeUx2WsDjQ5ijgKhZs3UIUIzZF0HpA4A6t8/1/N5ABfiGWKBsLkzpwYB9wgwcTVe8bniAqXG3a9AfndY1XP1b4hZRqsQaw9sxiiVR2SKWBEsFJCevLqiS0cePpv3Wq2rcFL+Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461766; c=relaxed/simple;
	bh=lL1Avl783rhITTu4HenSV62o9ZTr9XM5crHRP9Og7rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TL/f0AifP5Ykt4TLgtmI3F1XFSvypAm2UU2jMKhs2j4WhpGZq0e0O/W1xlhgfGzKGZ4ksc+Q+hGdIjqcN5ioIvRao3ENPVSFlwDLqBig6QaxVWRbvtvWZMGGCb7VtLcrRXU8S3NVkuPIIjcA2YHneSojpTeASNWEvKSd1Amw+W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=XudOJ7mX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=laRMAzTM; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=EHOK3G7L; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=hnIFZBUb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="XudOJ7mX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="laRMAzTM";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="EHOK3G7L";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="hnIFZBUb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D20F333694;
	Thu, 15 Jan 2026 07:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768461762;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlpvlU9RUc1F4iCVSO3rQkbgCwaKD8hJUxYfFKTEWPM=;
	b=XudOJ7mXjnIlMu3K7TB0kagbLb1j6nnRvRPD/IEC0DEoJZdAWPKWq6viZgqjpf2X5VNEap
	Cx6R4BrUaFXl+LF7szzxyk8SdYFXL4M/pMa7opi98bXMR//mtYJUpUBuLrzuwYVLVLhNNB
	FuEkbP/vrzh1iC9/wFPY/VixADrHNso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768461762;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlpvlU9RUc1F4iCVSO3rQkbgCwaKD8hJUxYfFKTEWPM=;
	b=laRMAzTMuY0e1xM1KJ0OlxKvtxtI3igNm1eI91cdWd7eQ9S5M3wV8LhKp8vZQkVLlPMwVa
	8WJzcpBCjMt/ZbDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768461760;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlpvlU9RUc1F4iCVSO3rQkbgCwaKD8hJUxYfFKTEWPM=;
	b=EHOK3G7LUt5NFSkL63tRI1gVs6DgtgfLeW9tSWAhPSyJqR8Dpu9TteYq98YSkVWxb2dPfl
	Cv5glKbITvpaCnUMw5WPyBYgW/f3xosTrbA43TNKzE8Jz4Rb1Wl24fBQGSVvLc9CCHS1k/
	CrBgnU+hNvH4jTulh75LGJnARVM4ciU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768461760;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlpvlU9RUc1F4iCVSO3rQkbgCwaKD8hJUxYfFKTEWPM=;
	b=hnIFZBUbDdTh8Jjf23yzSwZRQKE4wan9Aarv1CEz22nKP5qYRqNhnXLw+iH2vLihSYeB0T
	Da0DgR1RIODq1JCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B03F3EA63;
	Thu, 15 Jan 2026 07:22:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oXj3IMCVaGmrRwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Thu, 15 Jan 2026 07:22:40 +0000
Date: Thu, 15 Jan 2026 08:22:31 +0100
From: Petr Vorel <pvorel@suse.cz>
To: cryolitia@uniontech.com
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae via B4 Relay <devnull+cryolitia.uniontech.com@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, workflows@vger.kernel.org,
	niecheng1@uniontech.com, ltp@lists.linux.it, zhanjun@uniontech.com
Subject: Re: [LTP] [PATCH RESEND v2] checkpatch: Suppress warnings when
 Reported-by: is followed by Link:
Message-ID: <20260115072231.GA438294@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260113-checkpatch-v2-1-5dfe8b9f4d90@uniontech.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-checkpatch-v2-1-5dfe8b9f4d90@uniontech.com>
X-Spam-Score: -6.00
X-Spamd-Result: default: False [-6.00 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,perches.com,gmail.com,kernel.org,vger.kernel.org,kvack.org,uniontech.com,lists.linux.it];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[cryolitia.uniontech.com];
	REPLYTO_EQ_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

Hi Cryolitia,

> From: Cryolitia PukNgae <cryolitia@uniontech.com>

> > The tag should be followed by a Closes: tag pointing to the report,
> > unless the report is not available on the web. The Link: tag can be
> > used instead of Closes: if the patch fixes a part of the issue(s)
> > being reported.

Indeed, this is true, although there is a prerequisite:

	The Link: tag can be used instead of Closes: if the patch fixes a part of
	the issue(s) being reported.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

I also see you Cc LTP ML. FYI we vendored scripts/checkpatch.pl (with occasional
updates).

Kind regards,
Petr

> Accroding to Documentation/process/submitting-patches.rst , Link: is
> also acceptable to followed a Reported-by:

> Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
> ---
> Link to previous: https://lore.kernel.org/r/20251023-checkpatch-v1-1-ff73ed1027d6@uniontech.com
> ---
>  scripts/checkpatch.pl | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c0250244cf7a..dac9d98133c6 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3209,10 +3209,10 @@ sub process {
>  			if ($sign_off =~ /^reported(?:|-and-tested)-by:$/i) {
>  				if (!defined $lines[$linenr]) {
>  					WARN("BAD_REPORTED_BY_LINK",
> -					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . "\n");
> -				} elsif ($rawlines[$linenr] !~ /^closes:\s*/i) {
> +					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . "\n");
> +				} elsif ($rawlines[$linenr] !~ /^(closes|link):\s*/i) {
>  					WARN("BAD_REPORTED_BY_LINK",
> -					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
> +					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
>  				}
>  			}
>  		}
