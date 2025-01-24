Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D9166F32;
	Fri, 24 Jan 2025 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737708139; cv=none; b=C57s1kNEnn2qRp5AasimUL506fZqs302LpUkW1HVG7yWBgWa+6dXWi+OUoHYVSnlK/d62uOUP9NU1nIXr4/bAl3vRl6GrdmF49sB/RsqzlrCHleEMMHt2+WtmzQUg+kJRivnjNKsw+UmjdpzSNvAeC3FtXwRW7UP1PiQRzfMWLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737708139; c=relaxed/simple;
	bh=8MBAExHykGx72Q7QlYns/nJi1Cgc4QT7PjgA2ipXH4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJyTYGWQT4+I5UYudW3LvJnpwXnIWODetc92EA03TEKkwxxyZasdfG9RbgU7eBgj2/E/YxqMu/y2eHkzZGCTrneJcE5ESd+C9MxopA5JZ9UTQTmP7F6xZ2IGdEtHtMe6JTSWMD0CI7I3eey1F1yL1PY+BJSag0qHSIT2ydjpiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xYwGOHZc; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zCuCp6Yt; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xYwGOHZc; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zCuCp6Yt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xYwGOHZc";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zCuCp6Yt";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xYwGOHZc";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zCuCp6Yt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 95ED92116D;
	Fri, 24 Jan 2025 08:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737708127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P5pcIisQBoc/vj62B6JCNR0VgIqEyMNIvQJZH0InrtM=;
	b=xYwGOHZclR3jt7oMyZ1veuYdjq6rgrA3oLJrbA4cc0sya5HowdW8/7VP/JU6tpYMwkU96K
	OFDM3Z6t2b2ANbJRtnbe/loGTZ0eS8hH7FOuAUE+pxNH5peXAbGeStSejj3f1BzLzYpFSk
	UdgRY7TBdaiNICn3GxnGNJvowoQMXNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737708127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P5pcIisQBoc/vj62B6JCNR0VgIqEyMNIvQJZH0InrtM=;
	b=zCuCp6YtkQfEaW/34DdEH94HtiJqN3MfbKN7kVked5LFeniYbeHsfi+B/nf7NFbILQy4MD
	rEwt3tuFBDVPlyBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737708127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P5pcIisQBoc/vj62B6JCNR0VgIqEyMNIvQJZH0InrtM=;
	b=xYwGOHZclR3jt7oMyZ1veuYdjq6rgrA3oLJrbA4cc0sya5HowdW8/7VP/JU6tpYMwkU96K
	OFDM3Z6t2b2ANbJRtnbe/loGTZ0eS8hH7FOuAUE+pxNH5peXAbGeStSejj3f1BzLzYpFSk
	UdgRY7TBdaiNICn3GxnGNJvowoQMXNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737708127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P5pcIisQBoc/vj62B6JCNR0VgIqEyMNIvQJZH0InrtM=;
	b=zCuCp6YtkQfEaW/34DdEH94HtiJqN3MfbKN7kVked5LFeniYbeHsfi+B/nf7NFbILQy4MD
	rEwt3tuFBDVPlyBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69DA6139CB;
	Fri, 24 Jan 2025 08:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id seV4GV9Sk2c7XAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 24 Jan 2025 08:42:07 +0000
Message-ID: <c63dd8c4-a66a-4a97-ac94-70b3159ba3a8@suse.cz>
Date: Fri, 24 Jan 2025 09:42:07 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KFENCE: Clarify that sample allocations are not following
 NUMA or memory policies
Content-Language: en-US
To: Marco Elver <elver@google.com>
Cc: cl@gentwo.org, Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, Yang Shi <shy828301@gmail.com>,
 Huang Shijie <shijie@os.amperecomputing.com>, kasan-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux.com>
References: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org>
 <b788d591-4c5f-4c1d-be07-651db699fb7a@suse.cz>
 <CANpmjNM_2EB-sTBjPDADNh_cAEJS8euY_71pw0WNu2h_eisAYA@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <CANpmjNM_2EB-sTBjPDADNh_cAEJS8euY_71pw0WNu2h_eisAYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gentwo.org,google.com,lwn.net,linux-foundation.org,gmail.com,os.amperecomputing.com,googlegroups.com,vger.kernel.org,linux.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 1/24/25 09:37, Marco Elver wrote:
> On Fri, 24 Jan 2025 at 09:13, Vlastimil Babka <vbabka@suse.cz> wrote:
>>
>> On 1/23/25 23:44, Christoph Lameter via B4 Relay wrote:
>> > From: Christoph Lameter <cl@linux.com>
>> >
>> > KFENCE manages its own pools and redirects regular memory allocations
>> > to those pools in a sporadic way. The usual memory allocator features
>> > like NUMA, memory policies and pfmemalloc are not supported.
>>
>> Can it also violate __GFP_THISNODE constraint? That could be a problem, I
>> recall a problem in the past where it could have been not honoured by the
>> page allocator, leading to corruption of slab lists.
> 
> KFENCE does not sample page allocator allocations. Is kmalloc()
> allowed to take __GFP_THISNODE?

Yeah and SLUB is honouring it.
