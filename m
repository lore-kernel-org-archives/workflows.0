Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C833444C8D
	for <workflows@vger.kernel.org>; Thu, 29 Feb 2024 07:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191132; cv=none; b=iKy/fEdRckW4uLrnOKwAem6SlcHXSIoFYgyqF2/nMsth9fveWpXXEJWCi316HvhMRA8DA8TGCUTgpKYe/kAH3HRu/IbVaaiu2cFLyBRK7ER1mIZBheCeA8MbqL83FefvIl21eqfzz3b7iwGc0xI28kKr00AI3rxKeFOxNUQzAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191132; c=relaxed/simple;
	bh=1lmtinDg7QI4a5lZe18y8hI08kyulpBZcNUuSvhBtNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nk42TQopRcUet3m6BKfQ+TrXYbH6KyBNOr1eNN/UL6rmHKpbfS8cvYRw9xvT/xa1IGdjeCVAIdBzKA23SsSs9yh/O90lOYjDKzsw9g+eolxGd04tcz7KhdIaIqr08X2aKtA9rub3ZR2CDD05ndLbmBwP8KVuSnWCq9D5FSON+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qazbOS0L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xncoyz0R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qazbOS0L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xncoyz0R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qazbOS0L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xncoyz0R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qazbOS0L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xncoyz0R"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 394602289A;
	Thu, 29 Feb 2024 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709191125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KiN49q92axG5oRK+pAbaXfOYea52c0MUdWtmB0PwLaA=;
	b=qazbOS0LCqxos8WXiHSLki6/fYZYkj1H73YiRX5ZeZLyWdU9ZDqvSPIo8Qt0uJxB/2q48f
	tTNrIYlDlqawfN1H2Zi6WXwiAMrDHjdmDECP7Z6HHKuzZe4nV5decTTvTIyDvAqXn2dyeV
	VLvtx4oP/glyeCbRh7EpN9aJNroAbRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709191125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KiN49q92axG5oRK+pAbaXfOYea52c0MUdWtmB0PwLaA=;
	b=Xncoyz0RM+BNK13DHILgW2qgHihXj4TqzFaKVnMo0QcwpIMqoQDYypxaNQ4XqiX8PA3GS1
	MySWxCt62VgfF7CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709191125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KiN49q92axG5oRK+pAbaXfOYea52c0MUdWtmB0PwLaA=;
	b=qazbOS0LCqxos8WXiHSLki6/fYZYkj1H73YiRX5ZeZLyWdU9ZDqvSPIo8Qt0uJxB/2q48f
	tTNrIYlDlqawfN1H2Zi6WXwiAMrDHjdmDECP7Z6HHKuzZe4nV5decTTvTIyDvAqXn2dyeV
	VLvtx4oP/glyeCbRh7EpN9aJNroAbRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709191125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KiN49q92axG5oRK+pAbaXfOYea52c0MUdWtmB0PwLaA=;
	b=Xncoyz0RM+BNK13DHILgW2qgHihXj4TqzFaKVnMo0QcwpIMqoQDYypxaNQ4XqiX8PA3GS1
	MySWxCt62VgfF7CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C53AB13A58;
	Thu, 29 Feb 2024 07:18:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Pu8LdQv4GUwPAAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 29 Feb 2024 07:18:44 +0000
Message-ID: <5758922f-a11a-4bbe-88a4-b724f53b2e6f@suse.de>
Date: Thu, 29 Feb 2024 08:18:43 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@kernel.org, workflows@vger.kernel.org
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <964843ca-891b-4039-94b3-ed1046df2d69@acm.org>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <964843ca-891b-4039-94b3-ed1046df2d69@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qazbOS0L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Xncoyz0R
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 394602289A
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO

On 2/28/24 19:55, Bart Van Assche wrote:
> On 2/27/24 14:32, Konstantin Ryabitsev wrote:
>> I was playing with shell-gpt and wrote a quickie integration that 
>> would allow
>> retrieving (slimmed-down) threads from lore, feeding them to ChatGPT, and
>> asking it to provide some basic analysis of the thread contents. Here's a
>> recorded demo session:
>>
>> https://asciinema.org/a/643435
>>
>> A few notes:
>>
>> 1. This is obviously not a replacement for actually reading email, but 
>> can
>>     potentially be a useful asset for a busy maintainer who just wants 
>> a quick
>>     summary of a lengthy thread before they look at it in detail.
>> 2. This is not free or cheap! To digest a lengthy thread, you can expect
>>     ChatGPT to generate enough tokens to cost you $1 or more in API 
>> usage fees.
>>     I know it's nothing compared to how expensive some of y'all's time 
>> is, and
>>     you can probably easily get that expensed by your employers, but 
>> for many
>>     others it's a pretty expensive toy. I managed to make it a bit 
>> cheaper by
>>     doing some surgery on the threads before feeding them to chatgpt 
>> (like
>>     removing most of the message headers and throwing out some of the 
>> quoted
>>     content), but there's a limit to how much we can throw out before the
>>     analysis becomes dramatically less useful.
>> 3. This only works with ChatGPT-4, as most threads are too long for
>>     ChatGPT-3.5 to even process.
>>
>> So, the question is -- is this useful at all? Am I wasting time poking 
>> in this
>> direction, or is this something that would be of benefit to any of 
>> you? If the
>> latter, I will document how to set this up and commit the thread 
>> minimization
>> code I hacked together to make it cheaper.
> 
> Please do not publish the summaries generated by ChatGPT on the web. If
> these summaries would be published on the world wide web, ChatGPT or
> other LLMs probably would use these summaries as input data. If there
> would be any mistakes in these summaries, then these mistakes would end
> up being used as input data by multiple LLMs.
> 
Now there's a thought. Maybe we should do exactly the opposite, and 
posting _more_ ChatGPT generated content on the web?
Sending them into a deadly self-enforcing feedback loop?

But that's probably beside the point.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

