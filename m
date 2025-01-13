Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8613122BAC8;
	Mon, 13 Jan 2025 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780105; cv=none; b=CWgZBG6Z3xJgGdKgvnZQY4TvyW7CXLEbkF0QxWruUzEbVYCHo5u4M1H4S3ffLrzVy0b4PKYepLBvyQ+I6LXsct4x4cGjNdJ5gr9ink4VqtWVRmc3fd+d9N1QQDL80iJetbRiFV7L9fWqp0hN7l+bWqTZKBpJZZ+O3932ha3Cjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780105; c=relaxed/simple;
	bh=QxzjYODmVmKYPUKDEnVOMMe7L/S21Ze85/1uEa+0GGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqP2upum2An/Ry8bENuhfbagwnuT65H95MI5Yzgi4GV/ktK6oke05jvzKnSQcsuAnPuUwz3NKjQQ+ktmvJv2WdPjafPShbohdvEYwa9r0MhyV54yfJzsQznBX5BUf5Q8KUO85uT5qwjYrGve+aFTNRdnLUxFwqsgi29eGwpVGkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=tUJo7QFh; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=sqGPWvNh; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=tUJo7QFh; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=sqGPWvNh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tUJo7QFh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="sqGPWvNh";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tUJo7QFh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="sqGPWvNh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 875452116C;
	Mon, 13 Jan 2025 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736780101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IKQyeN4CyXaZPOtBPgr4HK5O8AvHffvySnw92pc3zXc=;
	b=tUJo7QFhCW0xfu5J9BNmqNGcipTPPUSwMHdIQbXs9ieWKPZgSFYvtSMCSFtq+PRQ6l1lY9
	teJf4JAPuEkgUd4qwc0595Fs9HaVI/wOWFiSeP1Udce2E+TjjJL1hxwm5heyWO7Zus8NlW
	hmBcjjht+ju1HMuiLH3SK+tDDhc6Nr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736780101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IKQyeN4CyXaZPOtBPgr4HK5O8AvHffvySnw92pc3zXc=;
	b=sqGPWvNhuHZAdV1Sm38DVrAOE12Y7vjWIcfYO3zTfmuq/KQTAY8cso85qVpt2vS6UuFk/K
	hPrHDBO3A9OZhqCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736780101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IKQyeN4CyXaZPOtBPgr4HK5O8AvHffvySnw92pc3zXc=;
	b=tUJo7QFhCW0xfu5J9BNmqNGcipTPPUSwMHdIQbXs9ieWKPZgSFYvtSMCSFtq+PRQ6l1lY9
	teJf4JAPuEkgUd4qwc0595Fs9HaVI/wOWFiSeP1Udce2E+TjjJL1hxwm5heyWO7Zus8NlW
	hmBcjjht+ju1HMuiLH3SK+tDDhc6Nr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736780101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IKQyeN4CyXaZPOtBPgr4HK5O8AvHffvySnw92pc3zXc=;
	b=sqGPWvNhuHZAdV1Sm38DVrAOE12Y7vjWIcfYO3zTfmuq/KQTAY8cso85qVpt2vS6UuFk/K
	hPrHDBO3A9OZhqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D33D13876;
	Mon, 13 Jan 2025 14:55:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ndBZGkUphWeUQgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 13 Jan 2025 14:55:01 +0000
Message-ID: <c2dea49d-58c1-4ff3-ac3a-097815c84aec@suse.cz>
Date: Mon, 13 Jan 2025 15:55:00 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] get_maintainer: decouple subsystem status from
 maintainer role
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Joe Perches <joe@perches.com>, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Kees Cook <kees@kernel.org>
References: <20241213112921.180978-2-vbabka@suse.cz>
 <202412172145.78ED0178@keescook>
 <7224dba8-97fd-458f-a262-50ce9b040f3b@leemhuis.info>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <7224dba8-97fd-458f-a262-50ce9b040f3b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 1/6/25 19:21, Thorsten Leemhuis wrote:
> Lo! From the "better reply late than never" department:
> 
> Thx for picking this up again, much appreciated!

Thank you both for the support :)

> On 18.12.24 06:48, Kees Cook wrote:
>> On Fri, Dec 13, 2024 at 12:29:22PM +0100, Vlastimil Babka wrote:
>>> The script currently uses the subystem's status (S: field) to change how
>>> maintainers are reported. One prominent example is when the status is
>>> Supported, the maintainers are reported as "(supporter:SUBSYSTEM)".
>>>
>>> This is misleading, as the Supported status defined as "Someone is
>>> actually paid to look after this." may not in fact apply to everyone
>>> listed as a maintainer, but only to some of them.
>>>
>>> It has also been confusing people to what "supporter" means and has
>>> required updates to the documentation [1].
>>>
>>> Thus stop applying the subsystem status to change "maintainer:" to
>>> anything else, as maintainers are maintainers. Instead, if the subsystem
>>> status is not the most common one (Maintained), indicate it as part of
>>> the subsystem name. So for example, instead of "(supporter:SUBSYSTEM)"
>>> report "(maintainer:SUBSYSTEM [supported])".
> 
> As Kees mentioned: "funded" might be better. Or is there even a better
> word for this? "backed"? "subsidized"?

Sure we can try find a better word, but in that case it should be applied at
the source, i.e. in MAINTAINERS, not in the script. After my change, the
script stops trying to reinterpret the exact wording from MAINTAINERS anyway.

> When I read this for the first time I thought "it would be better to
> keep the two aspects closer together, e.g.
> "(maintainer[supported]:SUBSYSTEM)". But then I read... (continue below)
> 

<snip>

>> Do we want to change "Supported" to "Funded" to help clear up the
>> meaning? (But yes, I agree, that the subsystem status should be applied
>> to the subsystem, not the individual contacts.)
> 
> ...this and thought: well, the current format of MAINTAINERS applies the
> status to all maintainers,

AFAIU it applies it to subsystems. It defines status e.g. as:

"Supported:   Someone is actually paid to look after this."

See how it says "someone", not "everyone with a M: entry". It's only the
script that's reinterpreting this definition (in a misleading way).

> even is some of them are funded while others
> are not. Changing this would likely require bigger changes. But I'm
> unsure if that is really worth it. Guess not, because it's likely a rare
> case. So I guess the format you chose is the best for now.

Agree. It should be enough to indicate to the submitter that "someone is
paid" and thus one of the M: people CC'd is hopefully more likely to respond
than if nobody is paid.
But I guess the biggest utility here is rather on the other side, i.e.
indicating "Orphan" or "Obsolete" can be a heads up wrt expectations of a reply.

> Thx again for doing this, I like it.

Thanks, will resubmit then as the original timing was quite close to
holidays. Will also look at indicating the subsystem status for reviewers
and mailing lists too (as I said, "Orphan" will likely not have an M: entry
which would carry the status in the first place), since nobody fluent in
Perl has volunteered :)

> Ciao, Thorsten

