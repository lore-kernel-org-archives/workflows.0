Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC763C6A4;
	Wed, 21 Feb 2024 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507855; cv=none; b=RYBFYLY9dQfeb929VZyqMvHPQdrNJxSN64ZqaZzUe7kKZp+UPUsR6B4P8ka+f3KLNygxcm5LJVoVfneKzbeleCL2h921gr0h7l52mqpqNXxpx1VkOmT+en+5GxNWFKAMOLZiH6fMcpvJlwuD9oNIT6ePNqmJfro65faqbV9uNSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507855; c=relaxed/simple;
	bh=5AQdP15gGEuN1KKgMUaSAwofjzI1sKeF3vorrIVEIfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhCwAMbrI0PgcJcJwV2GnMHb7QkiHHXaducmdiY2f1Xg/xBSNnkFYTQuWFbEG4W8GTkq8NUSwo5zdXNseyjhLPDmWI5Zpd/5owsdDnBf+cq+xVaNjvC5diL0EYdyfvVI/JkF34n+XE9XdhyIEiquHc7jow0B2BEL7mQ206Z9u5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=nMyH/kJB; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zPvaGOhp; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=nMyH/kJB; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zPvaGOhp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="nMyH/kJB";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zPvaGOhp";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="nMyH/kJB";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zPvaGOhp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 755811FB4A;
	Wed, 21 Feb 2024 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1708507852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7MiMJ/iYOL29JE+fM375ox7J/NTtKPqbT3x7J9HzmI=;
	b=nMyH/kJBl5CdA5h57lPr5JFbjgwyzR35B7njuPfaJxkwlmXQcI67FrUSIkj4KWcY9xuG1h
	0MH/Xorb5cqqSS1dkPbXYqPmd+TaQWI0spGXTJdSQG0pvlfPP4+qPLnR0aVxc8aRBJVCNC
	ZYAQqVLmoiJ7iccIAM3eg0lfPy8dyx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1708507852;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7MiMJ/iYOL29JE+fM375ox7J/NTtKPqbT3x7J9HzmI=;
	b=zPvaGOhp8KqwtGzrdOId69ERjcrT/PsjuijdigbcQKdBFv2sOm7zxd5KR/ezr+zE6r9GnC
	sE81jthmdDduZhCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1708507852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7MiMJ/iYOL29JE+fM375ox7J/NTtKPqbT3x7J9HzmI=;
	b=nMyH/kJBl5CdA5h57lPr5JFbjgwyzR35B7njuPfaJxkwlmXQcI67FrUSIkj4KWcY9xuG1h
	0MH/Xorb5cqqSS1dkPbXYqPmd+TaQWI0spGXTJdSQG0pvlfPP4+qPLnR0aVxc8aRBJVCNC
	ZYAQqVLmoiJ7iccIAM3eg0lfPy8dyx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1708507852;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7MiMJ/iYOL29JE+fM375ox7J/NTtKPqbT3x7J9HzmI=;
	b=zPvaGOhp8KqwtGzrdOId69ERjcrT/PsjuijdigbcQKdBFv2sOm7zxd5KR/ezr+zE6r9GnC
	sE81jthmdDduZhCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 666F3139D0;
	Wed, 21 Feb 2024 09:30:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DPZsGMzC1WUPNwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 21 Feb 2024 09:30:52 +0000
Message-ID: <5581ce8a-e669-465b-ab13-00e1c8ca91f3@suse.cz>
Date: Wed, 21 Feb 2024 10:30:52 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2023-52435: net: prevent mss overflow in skb_segment()
To: cve@kernel.org, linux-cve-announce@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 workflows@vger.kernel.org, Security Officers <security@kernel.org>
References: <2024022048-rind-huff-b1a2@gregkh>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <2024022048-rind-huff-b1a2@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.09 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.00)[25.50%];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.09

On 2/20/24 19:06, Greg Kroah-Hartman wrote:
> The Linux kernel CVE team has assigned CVE-2023-52435 to this issue.
> 
> 
> Affected and fixed versions
> ===========================
> 
> 	Issue introduced in 4.8 with commit 3953c46c3ac7 and fixed in 6.6.11 with commit 95b3904a261a
> 	Issue introduced in 4.8 with commit 3953c46c3ac7 and fixed in 6.7 with commit 23d05d563b7e

Hello,

what is the advice for stable users of versions between 4.19 and 6.1? Are
they not affected?

Thanks,
Vlastimil

> 
> Please see https://www.kernel.org or a full list of currently supported
> kernel versions by the kernel community.
> 
> Unaffected versions might change over time as fixes are backported to
> older supported kernel versions.  The official CVE entry at
> 	https://cve.org/CVERecord/?id=CVE-2023-52435
> will be updated if fixes are backported, please check that for the most
> up to date information about this issue.
> 
> 
> Affected files
> ==============
> 
> The file(s) affected by this issue are:
> 	net/core/skbuff.c
> 
> 
> Mitigation
> ==========
> 
> The Linux kernel CVE team recommends that you update to the latest
> stable kernel version for this, and many other bugfixes.  Individual
> changes are never tested alone, but rather are part of a larger kernel
> release.  Cherry-picking individual commits is not recommended or
> supported by the Linux kernel community at all.  If however, updating to
> the latest release is impossible, the individual changes to resolve this
> issue can be found at these commits:
> 	https://git.kernel.org/stable/c/95b3904a261a9f810205da560e802cc326f50d77
> 	https://git.kernel.org/stable/c/23d05d563b7e7b0314e65c8e882bc27eac2da8e7
> 

