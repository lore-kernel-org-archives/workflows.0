Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C14DD6C4
	for <workflows@vger.kernel.org>; Thu,  2 Jul 2026 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985900; cv=none; b=WaqJc3jP88r+Uj3MVHoAWZNFGuih81nN/oIVHp3wheXcOM1w2ZlJ08jilwv3Ua06zTsXrc764XVT21Fa67lqgw3xQpAZbHdI9LYZOFpZBThzuC56t2keDs4YqlguuS0voii7FoWn96kZbu8LGSfw8D1oRA6AZ/boauVr32AubFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985900; c=relaxed/simple;
	bh=/tsZLXAY/qwFyLxHrELB4IEfpzk+fsxBNjJEEz2oFZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNMmBDoC8f3FjRikMTnJyvCxZ5JkJ0lfw14gZpq3p5eQRPtMe12uBPynZj4goIPojx6EbPx887hDIshyt06Tlf/heTDBxE7oi/fyVTL/T6EpNvXiLufr2uiF1Bawqha+eEri2UqHwcICfn0Hz93zRWtoga84QB4xOSCB1E8bgK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7DED874108;
	Thu,  2 Jul 2026 09:51:37 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 294AF779AA;
	Thu,  2 Jul 2026 09:51:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ov+uCKk0RmrIEwAAD6G6ig
	(envelope-from <ddiss@suse.de>); Thu, 02 Jul 2026 09:51:37 +0000
Date: Thu, 2 Jul 2026 19:51:34 +1000
From: David Disseldorp <ddiss@suse.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Christian Brauner <brauner@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, David
 Hildenbrand <david@kernel.org>, Jeff Layton <jlayton@kernel.org>, Vlastimil
 Babka <vbabka@kernel.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <20260702195134.02077576.ddiss@suse.de>
In-Reply-To: <87jyreofpw.fsf@trenco.lwn.net>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
	<87jyreofpw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 7DED874108
X-Rspamd-Action: no action

On Wed, 01 Jul 2026 10:08:11 -0600, Jonathan Corbet wrote:

> > Why precisely do we require all this detailed information about what
> > specific coding assistant was used?  
> 
> From my memory of the discussions:
> 
> - If a specific LLM turns out to be in a bad position with regard to
>   some copyright ruling, we can identify the commits that might have
>   been tainted by it.
> 
> - Similarly should an LLM prove to have an inclination toward specific
>   types of security issues.
> 
> Whether either of these would ever actually prove useful is not
> something I can hazard a guess for.

In https://lwn.net/Articles/854645/ (An update on the UMN affair) you
documented a case where an organization acted maliciously, resulting in
the need to audit (and revert) numerous commits based on git authorship
metadata. IMO the existing Assisted-by tags, although far from perfect,
will be useful for audits when a specific LLM coding assistant is
similarly found to be generating malicious output.

Thanks, David
