Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022441D61A3;
	Fri, 24 Jan 2025 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737706443; cv=none; b=bp0n2PMy56RFi6sEcPrB1Y4016vxY7EctTxZmWql9YlAAQnh9ykPQVleeMegXBUjWbdsBdsjI5kCLCzrX1N6fasVB4LlMuYAZ8XtBXBUHVls5+Kl3Qgf1SDnE0hEap/secTqwcbqZekBpv2bz6g4ASjyjqUEUpYXpXQzYoT3Dzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737706443; c=relaxed/simple;
	bh=bRkw3r4HY5UOrnR8rHtajlL3sKrz1X4G/BPDU00jEjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfHRidfvW43Dm/KQjkdYy+4n2ctLhq57l8gle7HsAJaHi22Xv4sZ3b/7JYPl5YPCCFaOvec7es8UgqwRDpArSnvxg983zhn+wdTtEEaUcWOwqCv+hxD//MA7nt486eB/9UefLch03JLuEiCV4O/2QA+dh9S4hPEftJ+/fBVFqIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Z4ra255j; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=bWjT6Gqo; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pw+Mkixc; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=prBM1zKi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Z4ra255j";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="bWjT6Gqo";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pw+Mkixc";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="prBM1zKi"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E27C61F38C;
	Fri, 24 Jan 2025 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737706439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HHsPPvjg96ro625fCHdbmx9NdmMnNcX6YT3MfhhBF4k=;
	b=Z4ra255j9RxzMPgWMHQ533yadbybtvEd7bv35NaPuLa1v83JEIm69psoACWRhbT8lInyqe
	82IF1+3vLmW1ANDW5begLjPpSnDEGZPixakBHG7YiT70xo+w03NGCJShndvEhr/DFVNuCj
	VeN15q0px9d3pzhIk/e/o/ppJ7Sr9r0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737706439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HHsPPvjg96ro625fCHdbmx9NdmMnNcX6YT3MfhhBF4k=;
	b=bWjT6GqoEDyD5lV4fNXc6DlHFA6rB0bgy1XM1qtEamnPXqhuKSjqapRFuUk3bygeusFwS0
	+I9UoctuoFwB6WCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737706438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HHsPPvjg96ro625fCHdbmx9NdmMnNcX6YT3MfhhBF4k=;
	b=pw+Mkixc3Xmiwo0UA/JhvZDszpXiRSsDe6XzLiCSCOWQaWlPvnKtCf9YVrIgDJBLo5zqja
	nVuTHpu0wx8Yxolj/3u3iIB+1VGkd9zbM+ob7MvboXksmZMF3qYrC+O9uWs8z4FFu0ekqg
	CjklblOkxs+cVz2uiC24gmzVl7JabCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737706438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HHsPPvjg96ro625fCHdbmx9NdmMnNcX6YT3MfhhBF4k=;
	b=prBM1zKipLE7oJ8SrR+imhcD4rWo+zCrd9vT2/KG2kR1DyZIbMaRXZW8qqApLFqDDIxqL/
	Mdk+ZmTpipFjrtAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE783139CB;
	Fri, 24 Jan 2025 08:13:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mihrLMZLk2elTQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 24 Jan 2025 08:13:58 +0000
Message-ID: <b788d591-4c5f-4c1d-be07-651db699fb7a@suse.cz>
Date: Fri, 24 Jan 2025 09:13:58 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KFENCE: Clarify that sample allocations are not following
 NUMA or memory policies
To: cl@gentwo.org, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 Yang Shi <shy828301@gmail.com>, Huang Shijie <shijie@os.amperecomputing.com>
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Lameter <cl@linux.com>
References: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PsLBlAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJkBREIBQkRadznAAoJECJPp+fMgqZkNxIQ
 ALZRqwdUGzqL2aeSavbum/VF/+td+nZfuH0xeWiO2w8mG0+nPd5j9ujYeHcUP1edE7uQrjOC
 Gs9sm8+W1xYnbClMJTsXiAV88D2btFUdU1mCXURAL9wWZ8Jsmz5ZH2V6AUszvNezsS/VIT87
 AmTtj31TLDGwdxaZTSYLwAOOOtyqafOEq+gJB30RxTRE3h3G1zpO7OM9K6ysLdAlwAGYWgJJ
 V4JqGsQ/lyEtxxFpUCjb5Pztp7cQxhlkil0oBYHkudiG8j1U3DG8iC6rnB4yJaLphKx57NuQ
 PIY0Bccg+r9gIQ4XeSK2PQhdXdy3UWBr913ZQ9AI2usid3s5vabo4iBvpJNFLgUmxFnr73SJ
 KsRh/2OBsg1XXF/wRQGBO9vRuJUAbnaIVcmGOUogdBVS9Sun/Sy4GNA++KtFZK95U7J417/J
 Hub2xV6Ehc7UGW6fIvIQmzJ3zaTEfuriU1P8ayfddrAgZb25JnOW7L1zdYL8rXiezOyYZ8Fm
 ZyXjzWdO0RpxcUEp6GsJr11Bc4F3aae9OZtwtLL/jxc7y6pUugB00PodgnQ6CMcfR/HjXlae
 h2VS3zl9+tQWHu6s1R58t5BuMS2FNA58wU/IazImc/ZQA+slDBfhRDGYlExjg19UXWe/gMcl
 De3P1kxYPgZdGE2eZpRLIbt+rYnqQKy8UxlszsBNBFsZNTUBCACfQfpSsWJZyi+SHoRdVyX5
 J6rI7okc4+b571a7RXD5UhS9dlVRVVAtrU9ANSLqPTQKGVxHrqD39XSw8hxK61pw8p90pg4G
 /N3iuWEvyt+t0SxDDkClnGsDyRhlUyEWYFEoBrrCizbmahOUwqkJbNMfzj5Y7n7OIJOxNRkB
 IBOjPdF26dMP69BwePQao1M8Acrrex9sAHYjQGyVmReRjVEtv9iG4DoTsnIR3amKVk6si4Ea
 X/mrapJqSCcBUVYUFH8M7bsm4CSxier5ofy8jTEa/CfvkqpKThTMCQPNZKY7hke5qEq1CBk2
 wxhX48ZrJEFf1v3NuV3OimgsF2odzieNABEBAAHCwXwEGAEKACYCGwwWIQSpQNQ0mSwujpkQ
 PVAiT6fnzIKmZAUCZAUSmwUJDK5EZgAKCRAiT6fnzIKmZOJGEACOKABgo9wJXsbWhGWYO7mD
 8R8mUyJHqbvaz+yTLnvRwfe/VwafFfDMx5GYVYzMY9TWpA8psFTKTUIIQmx2scYsRBUwm5VI
 EurRWKqENcDRjyo+ol59j0FViYysjQQeobXBDDE31t5SBg++veI6tXfpco/UiKEsDswL1WAr
 tEAZaruo7254TyH+gydURl2wJuzo/aZ7Y7PpqaODbYv727Dvm5eX64HCyyAH0s6sOCyGF5/p
 eIhrOn24oBf67KtdAN3H9JoFNUVTYJc1VJU3R1JtVdgwEdr+NEciEfYl0O19VpLE/PZxP4wX
 PWnhf5WjdoNI1Xec+RcJ5p/pSel0jnvBX8L2cmniYnmI883NhtGZsEWj++wyKiS4NranDFlA
 HdDM3b4lUth1pTtABKQ1YuTvehj7EfoWD3bv9kuGZGPrAeFNiHPdOT7DaXKeHpW9homgtBxj
 8aX/UkSvEGJKUEbFL9cVa5tzyialGkSiZJNkWgeHe+jEcfRT6pJZOJidSCdzvJpbdJmm+eED
 w9XOLH1IIWh7RURU7G1iOfEfmImFeC3cbbS73LQEFGe1urxvIH5K/7vX+FkNcr9ujwWuPE9b
 1C2o4i/yZPLXIVy387EjA6GZMqvQUFuSTs/GeBcv0NjIQi8867H3uLjz+mQy63fAitsDwLmR
 EP+ylKVEKb0Q2A==
In-Reply-To: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gentwo.org,google.com,lwn.net,linux-foundation.org,gmail.com,os.amperecomputing.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 1/23/25 23:44, Christoph Lameter via B4 Relay wrote:
> From: Christoph Lameter <cl@linux.com>
> 
> KFENCE manages its own pools and redirects regular memory allocations
> to those pools in a sporadic way. The usual memory allocator features
> like NUMA, memory policies and pfmemalloc are not supported.

Can it also violate __GFP_THISNODE constraint? That could be a problem, I
recall a problem in the past where it could have been not honoured by the
page allocator, leading to corruption of slab lists.

> This means that one gets surprising object placement with KFENCE that
> may impact performance on some NUMA systems.
> 
> Update the description and make KFENCE depend on VM debugging
> having been enabled.
> 
> Signed-off-by: Christoph Lameter <cl@linux.com>
> ---
>  Documentation/dev-tools/kfence.rst |  4 +++-
>  lib/Kconfig.kfence                 | 10 ++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools/kfence.rst
> index 541899353865..27150780d6f5 100644
> --- a/Documentation/dev-tools/kfence.rst
> +++ b/Documentation/dev-tools/kfence.rst
> @@ -8,7 +8,9 @@ Kernel Electric-Fence (KFENCE) is a low-overhead sampling-based memory safety
>  error detector. KFENCE detects heap out-of-bounds access, use-after-free, and
>  invalid-free errors.
>  
> -KFENCE is designed to be enabled in production kernels, and has near zero
> +KFENCE is designed to be low overhead but does not implememnt the typical
> +memory allocation features for its samples like memory policies, NUMA and
> +management of emergency memory pools. It has near zero
>  performance overhead. Compared to KASAN, KFENCE trades performance for
>  precision. The main motivation behind KFENCE's design, is that with enough
>  total uptime KFENCE will detect bugs in code paths not typically exercised by
> diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
> index 6fbbebec683a..48d2a6a1be08 100644
> --- a/lib/Kconfig.kfence
> +++ b/lib/Kconfig.kfence
> @@ -5,14 +5,14 @@ config HAVE_ARCH_KFENCE
>  
>  menuconfig KFENCE
>  	bool "KFENCE: low-overhead sampling-based memory safety error detector"
> -	depends on HAVE_ARCH_KFENCE
> +	depends on HAVE_ARCH_KFENCE && DEBUG_VM
>  	select STACKTRACE
>  	select IRQ_WORK
>  	help
>  	  KFENCE is a low-overhead sampling-based detector of heap out-of-bounds
>  	  access, use-after-free, and invalid-free errors. KFENCE is designed
> -	  to have negligible cost to permit enabling it in production
> -	  environments.
> +	  to have negligible cost. KFENCE does not support NUMA features
> +	  and other memory allocator features for it sample allocations.
>  
>  	  See <file:Documentation/dev-tools/kfence.rst> for more details.
>  
> @@ -21,7 +21,9 @@ menuconfig KFENCE
>  	  detect, albeit at very different performance profiles. If you can
>  	  afford to use KASAN, continue using KASAN, for example in test
>  	  environments. If your kernel targets production use, and cannot
> -	  enable KASAN due to its cost, consider using KFENCE.
> +	  enable KASAN due to its cost and you are not using NUMA and have
> +	  no use of the memory reserve logic of the memory allocators,
> +	  consider using KFENCE.
>  
>  if KFENCE
>  
> 
> ---
> base-commit: d0d106a2bd21499901299160744e5fe9f4c83ddb
> change-id: 20250123-kfence_doc_update-93b4576c25bb
> 
> Best regards,

