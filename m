Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777028;
	b=4Joi+c1eg/Fxwj8RGeMUmQ/hs/L9zuHYBB6L1IivGIoM6T7c/ZDQSmx5G1qDRelcReJO
	 1kIh2j1SpkEQcczU6YfCoV2pDhsh2WE4aZnHk4m8nOPs8x/o4bQWJ3AGc0N3HRlokF3sV
	 2S2WX+sayEIIfg2V2I3ktAMoaRZaGAI7Y2yYaS0JRHF2ln9eE9uAw7L3iv56dVEAYzMDa
	 gANru4rtJ3eLZyb1zO40e21eEEnjTRxEwBxDXNlwsSndRlhUJrGvQ9BMHUPLfEzFNOzcj
	 PdWqXGgijm8nO2RyPgLdAW/r3YsQnkpiHTeHtyA6VJ7TmKu8M1/Is4x9WI0I9hd1Whg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777028;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=Ahv8hek+EvAXMKlXCTALJglEGd0QFHOYDAP+RILIW24=;
	b=m5RfjCB5dTwDo5/VDo6KKQBbbimlIqnzEdTLFwgwlMhYniA8XcYREETsoBxeBwUkH9tr
	 Z17EkBxiq5ddbdsBMpSDJLCbX7EBaNxedAT/eKOnwU9YJ/7CKoIOFPsGeJFpUl4NgDRLO
	 F4pok0G4V6ja1hOskJvagWdR9BcAy9VlM6Se1WV1Q4eR5oOk/oVyXV2LS+FdiMThjmGRg
	 q3WmNHY1V3fiWDcXl4UR228e9cGfTNleoue6KV7KbnAoXBJNc3tivj0oLFtnP7NBVeAb9
	 18FWVsgI8dcrWuZziqbVa/ua5/MRIYv8owNT8Y5Qh+XQHB4qzYIxHn0cdZKnivwLqYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcXzpRAE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JicNh2Nh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7598606A31E
	for <workflows@vger.kernel.org>; Fri, 23 Oct 2026 17:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7598606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcXzpRAE;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JicNh2Nh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792777026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ahv8hek+EvAXMKlXCTALJglEGd0QFHOYDAP+RILIW24=;
	b=bcXzpRAEtifAQMtobXDOy+r0fJO0AGF97q8jjwObWvTjli2cYerUdcjM327aE3Wf5tqqhz
	KfeUcbftikZCbzMyZpizcEorceFcOSahF4TQViGq+P1T9st99gM41SF5CU3oxIDSk8xFHL
	vA+iROSjLULPAju9RxxyWY0OaqTuT9k=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-vN-4rNVsPoaPnU3KcMOAAw-1; Fri, 23 Oct 2026 13:36:59 -0400
X-MC-Unique: vN-4rNVsPoaPnU3KcMOAAw-1
X-Mimecast-MFC-AGG-ID: vN-4rNVsPoaPnU3KcMOAAw_1792777019
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5352436cd78so4257691cf.0
        for <workflows@vger.kernel.org>; Fri, 23 Oct 2026 10:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792777019; x=1793381819; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ahv8hek+EvAXMKlXCTALJglEGd0QFHOYDAP+RILIW24=;
        b=JicNh2NhM+bKqjfVJxtTDyhDIfJgYLdNUjZ5zqhe+edMq2OmfAgFtlKCFG+vNETJ8z
         3rX/VDQVLyZ46UeSllkvbid2D9dNPM8OFah48hRSUKbjGC1aIroWp5KE+2PBLRYHBFpo
         +J09gN9+Z1C4ZBBr91u9tr3Mkfd0SeIFT2GDQWGVysGqtWYMbKJGi9Ksua1VOPUkHDCZ
         eX03l3QwsEuKqCC515rSmjBYxNy1+1bOlMFBZc/gPvrwObEyq2LtpKWMvcRP8zIPqxwF
         GOUwemyNg90HAl8jCIXGZpKguyRSA+va9xj0Vv5qPw2oTGVX3wxsVdfhQ4FBzRjEnpbe
         JSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777019; x=1793381819;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ahv8hek+EvAXMKlXCTALJglEGd0QFHOYDAP+RILIW24=;
        b=J041n5I/CJ5APeVHoMfBi3ccor4XjJIlSnibVO5xd90bT3fXgYgzAO94IPRiGK7mTb
         DdPg0MCLtQmsJatbYZi/mGnTXJnrZ5oZsq31fC7UydEnXVfkTOdIplxcx565Vc6uD6wj
         8xNVFjbky7E7tyok1q2/luUhYbNla9cTz3INUaPxFyD6Lncb6vQKgb08d7R7pGfAuQ0P
         oggXyGOqM5V45b+naKcWqPbDJjwtzPNjUr8fxponGvUgq2nywpiQMaD7S0JJV7IE5Fs0
         6A/o0V934yv6ZOX/5OgJOSG5Gm0aVrU+fakYbGppq1e48D0uy+Sp4/MxpFkRakuhr19t
         8ewQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEIu2+HhBdqDTbCxKoVTEsVQ2kRNB2XzyQHQFMOk1xkmi6m9TelyydwmoIKkmUFUHGxdAsA7VbZn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAceVkS0kYRR09gJ2Q4PwPPYEn+7ILiBW/XwbVbWRLXNXqZuX0
	xpR6GBiNbw0V6hcYzstE8fPjcWbA9Ia1OdGQM5gwbsGX/TkUl4JBAZSOtfp1GzxprTMccTLiELS
	H1AztldUUHjDS4lkbAbXbEYn1OANoWjBQVrpwE+4ipEcAqmfsQysyVtNbSQQlioTms3pygQ==
X-Gm-Gg: AYBFou2gK/ztFoaPwZDFhZjaREJV35bOzVV9GwVRt8ecxxPLLqED4tNC2+//PtyXhUz
	L50O/6om7yk4rmwk+t37m1uSzgUgileaHp5SUPaz0WcXOoOH55/uVO6Z7il5D1wmzyIcq258EiN
	aPllYyvhcXsaOnK0hnfUdsCsBtWImV9nvkLZdSD1tG3BO1PCNZDiqVMykgSVqyy5RpgLDReonMs
	/Ckd5ZmFAgkkoZEjifoDYhvlTPA4UATi5+xV1x+2eW9L7iSbpxpIka5JdlQSpg5R5OWOc4ACZjK
	SJDYMT37Q7763zGoJPkrsOuWE6gEhEuN+VZ6w7q1Kg0dy5EXlgRZuJo+AbsyuHSQNlwayqw=
X-Received: by 2002:a05:622a:5b97:b0:532:f0a2:ef4 with SMTP id d75a77b69052e-536c25f7a86mr39840401cf.26.1792777018662;
        Fri, 23 Oct 2026 10:36:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5b97:b0:532:f0a2:ef4 with SMTP id d75a77b69052e-536c25f7a86mr39839981cf.26.1792777018044;
        Fri, 23 Oct 2026 10:36:58 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53836c4c71fsm2658041cf.25.2026.10.23.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:36:56 -0700 (PDT)
Message-ID: <04409702791cbc2519355d2291ae9db5f4e44339.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by reference
From: lyude@redhat.com
To: Troy Benjegerdes <hozer@hozed.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>,
 corbet@lwn.net, 	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 apw@canonical.com, 	joe@perches.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 23 Oct 2026 13:36:55 -0400
In-Reply-To: <atoNuurgxrKV4aid@false>
References: <20261009083137.3-1-sashal@kernel.org>
	 <202610122124.08E058768D@keescook>
	 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
	 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
	 <4a55a48948a1f01686b0471307b6fc2d52be7896.camel@redhat.com>
	 <atoNuurgxrKV4aid@false>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-10-22 at 13:20 +0000, Troy Benjegerdes wrote:
>=20
>=20
> This is why I'd like to know *which* LLM I'm dealing with, so at
> least
> if the human is not paying attention, maybe the LLM developers will
> care
> enough to provision a large enough context window to actually retain
> the
> critique.

I have to be honest: if the human is not paying attention, it is the
same as a contributor repeatedly sending patches and not responding to
patch reviews in any meaningful way. I don't see any reason why
maintainers should be responsible for carrying the patch the rest of
the way, this falls straight into slop territory and goes even further
into "if I see someone repeatedly doing this with their submissions the
chance of me actually looking over any of them goes down dramatically".

Also, it's not like it gets the critique anyway. Whether or not it
follows it is up to chance.

