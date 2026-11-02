Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611932;
	b=cyb9sPKaw0OW8pXPK9Mo7hmWvaM4bkOXfnrzRwBxnBvlA7EdGk3nmDwyLZcIngTYD6KV
	 RDnas2MmmyB6D+lGaTQQElHqMSY8XWi3SNo22JO86+q1FKPhug3lRAI1GA4zyr3CChETU
	 ULPVMwe2aGB7EN/OOuyYbQtkr0/vN5a29zLFTAidBR+kV6iVlZ3TbhiRzbIh3tPg05Xp6
	 lFvHan9vBMWKFok6oN80jeKybNzbT1fLXVRk2CiixtmFblkle0DydZaNe5mo1R/mx9SY5
	 vC8P5pySurfaT4D8vOVt0l4byVBUPvxjzJ7Fwz3t0grz/4jWPqoBM07sJ2+C2o8Mvww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=35OPEA1cAH13Z9hOqiCXUigqcDoqvmC2TZUEsIA2WY8=;
	b=BbHweox07XJgXy0uogPfPK9dZkbGpiWIt8dkxb8hBy3jfReQf2mhT5W7usqm9zlsW49L
	 R9eGVrLpCttlLkTlvUJTAg6KQEP41T9l4M2vxvYvVShJTuZ62ANE1xYgeOjbguTWs5cYN
	 RqtT1kC75N7+s0zdrD4xnE8J+zPewbB1voSMN1dXNyq9Wbf95ZckkQc6mgTKU9yWa3G6U
	 upZMB7dTX52nHmlv3AuatiGhmpeRzobprgrGIHGdIUQNd+Zf1up4ZSWaIvEZ17zI/PPHp
	 WX5IXZJuZzViNSuaM+IDLCerBzA2x4jBa/DZPK/zGdU+6Gy7lBUClQFhioeTc+j2QLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEpjqEmF;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E32606A324
	for <workflows@vger.kernel.org>; Mon,  2 Nov 2026 09:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E32606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEpjqEmF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1452087f8f.3
        for <workflows@vger.kernel.org>; Mon, 02 Nov 2026 01:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793611930; x=1794216730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35OPEA1cAH13Z9hOqiCXUigqcDoqvmC2TZUEsIA2WY8=;
        b=oEpjqEmFsTTVnphOxajM27MUmU9VHtSQ9qLPvz1O/pZnaoSJXmeVH01y3CbaLFWc6c
         2BMvNkuAh2Pmx/RNEe06DxFSjMjDDnbhZIVKO09kqcvqqpceUCqEkYS3t12sfLKzUR0K
         CTcSnHe3Uo89zqz4H6yMqyymae9sKq//zdJYc4Gn/svz0Q2skD+XWZ7RTDyWA+J+PYnX
         YzwM9/+sYtVDCSeFvQVJAqAwTf+oo1GqaNRZtY0pdgMcHwt5sa/N5FKgmaMH1vJIuSeq
         shC2tGB2G4QptriloCMlBZiguw+sPj8dTweXqKmEHojyICQUR1ooGBnzvbVz/N/Dy2ax
         THGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611930; x=1794216730;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35OPEA1cAH13Z9hOqiCXUigqcDoqvmC2TZUEsIA2WY8=;
        b=dSqIZSp87WygXQzljygIqCsYb73hwUgCRp1zRpoEaIIzEin30atCRGBV8QmKu9XAE6
         mzjbq9GEXh9vHfyHwPI4Hht5Q8mQQeadTDaJXrGMlVtcK5tb/vHwRYW6rQRwBbIyNZUo
         Of8YWsQPmxihMFqPasdSJxk+HSDTHNS5yuIECcsixXKWsatj8kDTN2bCEHZ++fxNAxvL
         adJwAEpwcLYt/BH4pa93UuvuMvQbM4zMQzMTeexf4dikFM7569OBrZqMV1n2HR6jcNMp
         m2zRqxWtHdWmwi6ncSVe0iH9TruwS06JAT2KoUM8ifytFeIlAR0fd+knfE8sqmU3G0JS
         I9kw==
X-Forwarded-Encrypted: i=1; AKwUvBy2n5TWgsdiLpaSd2aQtGmFprnxLLsR5IXabbMYJfmK/BJfo0inm+oumD6wefPUhLPf36Cp1zvq/yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z875U4jxQqig4GRkE4GQZ8XaiBnYkGBE3WwAPdyn6UwrAaP2Gto
	IJSOy9zlY5nhHV1eNY6VLngZMKp4t6kFMZXjq0VtJK0JgTlnvQ8IQ2J2
X-Gm-Gg: AYBFou0+NIlkff3OmE9EShcQNeIqm5CX6bkpuTA7xye0Aev1k1OTb4ufvhTD1XUhK9V
	Sss2nJIL6A1AzcQVRExB0xe1Gfu5JSwlTtODkWx+KW7lv+ACAD9pPUumEWUkadtJ+7HqAoqQaxj
	iBeDGGDtW0nQTvAi1Rj3RMC3q9q3nvny4iLLdlHrEY+C+nH/4rA/SkTAayOPtYR2DzcE2fsyK9k
	X43dNBkAFWMyTyX68wUUo2LDD4UMPYTJL9l3EuIVBfCQ6TDN/jDUIpuAcD86sBEaSMP/o096Ek9
	SW1Of7Sn79GZtLXyHh7+KRwlAkgITRd0pgC2/Cxg2Mz5YQBFGr4gWbQYwtIK/WfshvAHkSIAsEi
	VZGGSvr4eZfr3TzVZobBxnVAowwiSHXmBBdCdksbaomRlQjT9f5s3TaGas3hZg4sJ2potPMLlth
	NvwaSb5IQGm4Y7cYf5xbhGdEK8a1pez4dsAHfIoxKJ8V91k2ezQCivloCRZJJ2Yigbx6ph/XBzu
	KKCiv1Ve5qB3JMGtjzLm1t+TCXM4YlKMZDLNrPbvphlqQLBbGSFyVxolrZYiWMyQtoKRA5JBEIU
	I8H4Obmm3LhlRv2NDpLvtmM20GRCap4uCmF60TGK/fmmf3TcsRG3CeApmEmLlZmg
X-Received: by 2002:a05:6000:260b:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e6e50075cmr19683105f8f.48.1793611930174;
        Mon, 02 Nov 2026 01:32:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d425sm19441700f8f.1.2026.11.02.01.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:32:08 -0800 (PST)
Date: Mon, 2 Nov 2026 09:32:06 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102093206.50b6c9ad@pumpkin>
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 11:35:24 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> LKML has become mostly a firehose of patches that are already going to a
> subsystem list. The reason is THE REST: it matches every file in the
> tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> single patch. During the week of Oct 1-7, 2026:
> 
>   - LKML carried 13,641 messages (~1,950/day), 90% of which were also
>     sent to at least one other list;
>   - with ~2,100 subscribers, that is about 29 million deliveries per
>     week for LKML alone.

That sort of implies that 2100 people are happy to receive all the
patch emails.
Take them away and there won't be much left.
OTOH you can't subscribe a gmail address - you miss most of the emails.

> 
> This issue came up during the 2026 Maintainer Summit and the consensus
> was that "always include linux-kernel for every patch" was never the
> intent.
> 
> This series makes THE REST a fallback as initially intended: it is only
> added for a file when no other matching MAINTAINERS section provides a
> mailing list that get_maintainer.pl would actually output for it.
> Patch 2 updates submitting-patches.rst, which currently tells submitters
> to send every patch to LKML.

Hmmm....

That means that changes that misuse standard functions (like min_t) won't
be spotted because they are hidden from anyone who might just spot from the
subject that something odd might be going on.

David

> 
> Several v1 reviewers asked for a catch-all list that would keep carrying
> every patch for those who want to follow all kernel development. That
> is a worthwhile discussion, but it is separate from this series, which
> only restores THE REST to its original role.
> 
> Translation maintainers are Cc'd because the it_IT, ja_JP, sp_SP, zh_CN
> and zh_TW versions of submitting-patches.rst carry the same "send every
> patch to LKML" advice and will need a follow-up update once the English
> text is settled.
> 
> ---
> Changes in v2:
> - Don't count subscribers-only lists (or moderated lists with
>   --no-moderated) as a destination, since get_maintainer.pl doesn't
>   output them; v1 sent patches to e.g. fs/squashfs/ to no list at all
> - Add submitting-patches.rst update describing LKML as the list of last
>   resort (Petr Pavlu)
> - Rebase on v7.3
> - Link to v1: https://patch.msgid.link/20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org
> 
> ---
> Konstantin Ryabitsev (2):
>       get_maintainer: only use THE REST as a fallback
>       docs: submitting-patches: make LKML a list of last resort again
> 
>  Documentation/process/submitting-patches.rst |  9 ++++--
>  scripts/get_maintainer.pl                    | 43 ++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 3 deletions(-)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> change-id: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4
> 
> Best regards,
> --  
> Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> 
> 

