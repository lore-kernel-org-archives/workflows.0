Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426888;
	b=nWhLZbSrpXdykhZtZ+SJyy7TXOqcJ+AbmSd8nKTEcTDkuskmZLH/siR1aI6mRttzSras
	 dQXfQMRmrLPGYDEGRh5lYKR/GKhIbiV4WrabyJAggPzp5DaL/O/kdbWNBkRPi8Ry7vRS3
	 rxflhE+zX/yEHPVtog5zDT76Quaog7kL2P59mKuR+Uq6O+MP8udILsz+RrVgQNapgfUqB
	 iVQWImoDCmNpnwN2GNvoco7cMpaLauWBY8U7u8FEpiMB9BuagQi+SSt8ri/61IXH0Idsp
	 LMarX8ZSAr/2MkfZACBhLM5vj0anOmfq+qFfG0dFHnX5BzALei0t4LGTBy7kUi+DkTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426888;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=GHs0/gDr8EptH4dRJZ9/o18rXIjU8lVzShf3k6REhvo=;
	b=Jm33+PXHV0aprgjRPDoZHRKsthsXO3lv/LxgKmYOyVxviitH6UkeUtb4m8EgVQH4ax7k
	 xGcSaPXQeO1PD9wxrXieXuilDYdmT2fWkTLlUwqbZmOAm4sv0cM5s5gYgfZHXiQ9h7px9
	 vfkUfmhRU5xeSg66DdUc+Z0hDaRKD84PHrNyz4Ilc67X3hEd4WaZfZAKCG0BF3+94ZFwM
	 lSkZfK7OtRUapgvmRBUDBQscHu/2XcxnYtAOx8Yi99csz4ujrBMJzNWvvefB1lQ3KLz4f
	 r7MK5Xa5tcTheR5ENFWg+zm1+bDWyioiMriOuU0Ot/obcYSSrcpSRitgzaFLDBMdSuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3m0mLNe;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IPKp3SdH;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E8D606A31A
	for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 16:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E8D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3m0mLNe;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IPKp3SdH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792426887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHs0/gDr8EptH4dRJZ9/o18rXIjU8lVzShf3k6REhvo=;
	b=Q3m0mLNeHi2LmPYTQyaoiVPXnwNZSfFtv1+UwTYrLQ/ivNmcOcF7oAqvVGFB5+66ryyDHy
	cN1sJQyM/bTx3Ufs9Hmccxfi500LlRAcPH97QoD9r+YyagvYCq7HVcTDO6/IlL7mUhi76Q
	A5EJajo7yOIkr9cV2ZKUT2lBmPb9Cko=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-zrDun8p1NNaS-dEGr5sZOg-1; Mon, 19 Oct 2026 16:21:19 +0000
X-MC-Unique: zrDun8p1NNaS-dEGr5sZOg-1
X-Mimecast-MFC-AGG-ID: zrDun8p1NNaS-dEGr5sZOg_1792426879
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5ab5c136so393118685a.3
        for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792426879; x=1793031679; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GHs0/gDr8EptH4dRJZ9/o18rXIjU8lVzShf3k6REhvo=;
        b=IPKp3SdHzNcMMUFRjMN0z4IjBKdz185MM/ojfsCW0G0I56u/5CoIiVm0Rj7KseYb7f
         06/jK+4EMISm/kY+7CkORTxSVPRjTKD+DVinUZo+zwvH5vvBIK5AGjceiR3oUrGb+TXi
         okDRqcxvfHFkZfrNAlwLgFYSVnCaEVco0O3mZnpFcrIEaUiQme5bso73uj/x1ykiZ4VE
         ZzhEFpfpFjOmpb77TN7cG7DM4h6MRn5x+WsgdWdTHAoReWv3EtflVi+NboGCedgwJ3TE
         cc9Wu6Mjg1yiE7mhQ+ghSG0CibLSl/c97ZiAngnVz+WxR7cq0d2RNmXElwQ2OtCqMgOP
         tgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426879; x=1793031679;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHs0/gDr8EptH4dRJZ9/o18rXIjU8lVzShf3k6REhvo=;
        b=CtEvo6B1uM+Yi0GL0ONXLwDdXlAT86Fw28DK2STAE6btgom/V1BY/wo2q/i6eE3G8b
         Ue8cObI1SDG23kFMQVijeYyQ5UkzBU48pfgJkHy5d2vwsy6cRmSTos5VBWrgbM12Up3X
         bVzgMC37hNX/GVBetqTFGaTFFHSQ143kSHrVaS8xrRieNQIGf8gV8YKewN+BRNXDq+g9
         t8VoZd7MMrGZNhEZkw/zmBzTf5Rw03R5YZKGt/Oy+9KOHCKX5lCpjIkWCXlFaa0DH6K6
         GsSrJ1vbHNYsVxZxMjKnl/vJbJeTAZMsfphZwPogiCQcaqvcQPaqvpqkWNJRKZRDe+ZB
         FnBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOclkY23T3WtyuL9UH68nLKiKQ/cchoTHrzidpW8GCDYGb+ikfEzJJnwf8BaR8/mN5iQP1TW5cZFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWIoyOoVMA2qHwQdEVuRuOhMqh4Zs8+VEefw9NX6lQOcOwOKX4
	Y0j9dSph4+60Yesjj4VzlNr+t1D3LZk98ia7VufQD5MFcRHeEZP/cD6iHLQ0mBugNTTyMqk1Xk8
	XKgDBMwco5+qSpXJWbFw//+ZqDTRzh0Xow5SL/dgcodZOjv3eC0YzFFKUMsptIg==
X-Gm-Gg: AYBFou1MFfckwKf2PuzPdA5ptIeXuOFF2cJoMylb6lbfefWaF7fGyoTWuYGKAhHAtDM
	peOoUxed0A58v7h4dDxpTuwvA4pt7lsRv6HP8vyvcudP3pv0I0QGiSNaLs1Nx+ITRyhuvnt2xAA
	yTrHkxfPx9F9Dto6DXdRSHVkkAQm1VPbrLcDroLnO4tC0IN0JvQkxYbgAfJkYRxhBCj79ClGFAZ
	ZcIpwUHlCIEhaKZ9FKvrnQqr1mDPTBKFdA7sATv92hyzy36hW+XcBac6TZzPcJZhpig0o8/axz0
	39rQZiOBVNFx+rEjyYp9SAYJmP8ACA/UC7AFkfFxNnKcqVuQRuyhdpuSLsr3MrAoa68Pc6Q=
X-Received: by 2002:a05:620a:1a17:b0:93f:1ed3:a9d6 with SMTP id af79cd13be357-93f29d39476mr1436081685a.38.1792426879117;
        Mon, 19 Oct 2026 09:21:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93f:1ed3:a9d6 with SMTP id af79cd13be357-93f29d39476mr1436073785a.38.1792426878408;
        Mon, 19 Oct 2026 09:21:18 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a17f226sm998258985a.17.2026.10.19.09.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:21:17 -0700 (PDT)
Message-ID: <f89d8c26ea178cc326aeda2d43d1a27a8f8d0e8b.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: lyude@redhat.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Lorenzo Stoakes
 (ARM)" <ljs@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Linus Torvalds
 <torvalds@linux-foundation.org>, Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino	 <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jori
 Koolstra	 <jkoolstra@xs4all.nl>, Brian Foster <bfoster@redhat.com>,
 Christoph Hellwig	 <hch@infradead.org>, David Disseldorp <ddiss@suse.de>,
 Mark Brown	 <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Jens
 Axboe	 <axboe@kernel.dk>, "David Hildenbrand (Arm)" <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)"
 <brauner@kernel.org>
Date: Mon, 19 Oct 2026 12:21:16 -0400
In-Reply-To: <20261013131243.GM56180@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
	 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
	 <asz9AeFe3CutP73z@gremlin>
	 <20261013123132.GC4214@killaraus.ideasonboard.com>
	 <as4pAEnLd4H68W4W@gremlin>
	 <20261013131243.GM56180@killaraus.ideasonboard.com>
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

On Tue, 2026-10-13 at 15:12 +0200, Laurent Pinchart wrote:
> How do you decide which patches to ignore ?

Seriously.

There isn't a little slop icon that comes with a slop submission,
people actually have to sit down and take time to read through it
before determining whether or not to ignore it.

If people are ignoring patches without even reading them, that's going
to be a serious issue that is going to lock a lot of well meaning new
contributors out. We already have a tremendous issue in multiple
subsystems with maintainers being able to keep up with workloads, the
issue that should be getting solved here is being -more clear- about
how an LLM was used so that people who aren't just copying code
straight from their chat bot don't need to tag things.

