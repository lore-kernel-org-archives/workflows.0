Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427169;
	b=lVfLOoNz3L3tHSm6I6/dkdta3VySq/NxcJK43pEY25ToiqiRfJDYP8UDnQ9onAhHSZ7e
	 527LJAU3FKCDQE2hZILw2EO9AzRlsHDU9Bsc8nH6lL9/f8hnbb1uAa5cl5PmAdIaf9MNf
	 slAut6gtin+jQMdOdsxX7F3VGn/S80FHP3pgbPu8SxP9fa04TAtewNWoTROomicQbFq4V
	 9GbtnfwaW7TuBabnuxTj2WR7iUQwrvudQUx+VvYEYXsKW1JnjCII3svt9Ft6pfSuF4GEH
	 tTdqqK0nf3JzWkRHpPc3daSDmZG8+BMR5TB51GSPjo+aD8hNM2X2eVElsq6zWv7dDRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427169;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=NE+y3DSsi5rykR4670p1tFrN+yLiaIR6vwkREYtVCfo=;
	b=pfwrvLwPR3Qk0NFfKRAN9CkDtvqlf7estHSc8rgp1MAegQswQM46w6Ii7St4H5b4yevY
	 Sa0ZJUiCEV0qfrX2tAFPZWUJI7DS6zOga/eLDfP3wMC0R+qZClPq9E+ZZTbq6vfq0ELTU
	 fZ62e/LoVSEVw7qdAIQp0irIAWn3lc+5gRfE9JY/NOwV6Iv+AJD+CV0QItnZXI1CLRqel
	 glzfMPZiiTZUuqYL5jNKisW7/auqSFUN04Vl9OdH85d/qmERGG6Ux6f6mWyOhyV65hmmF
	 gq1Kot6xyT75wUD7caTHEPten4xhX3atw2GUTsPvGVOKi918reo8Xow2XGRlK37mavA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZW9Y+LJT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E843+SRy;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2F060A381B
	for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 16:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF2F060A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZW9Y+LJT;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E843+SRy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792427167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NE+y3DSsi5rykR4670p1tFrN+yLiaIR6vwkREYtVCfo=;
	b=ZW9Y+LJT0Xm6p7QN5x37Jhv2y4IegoagKJAjWaVdZ26jbAmNjsLESRf1eaiAWu5p5ATwpZ
	K7ITDxw0DHwu7jls1lWHIxyIZQgSZ5VF7CWIWJKzNDITiL3caZ+4+Bn5iX80ucaY1fmPAe
	AYD8YtBnWIsfBpSwylQu3061zPdIpyQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-PsgE33CfNheVbq6Oj6vsog-1; Mon, 19 Oct 2026 16:26:06 +0000
X-MC-Unique: PsgE33CfNheVbq6Oj6vsog-1
X-Mimecast-MFC-AGG-ID: PsgE33CfNheVbq6Oj6vsog_1792427166
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so794603185a.3
        for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 09:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792427166; x=1793031966; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NE+y3DSsi5rykR4670p1tFrN+yLiaIR6vwkREYtVCfo=;
        b=E843+SRysxfQYQQsFLy+KFU2KC/052g1nf2jG0DcDAxvRDpiYQYfJF9Op1jxL8GZpk
         0zJSbViwosptwu2TpgyOebyDjiI7AX9SGfIQSuZksPhsZI6B7byGV86zMt+hCLAYtQ4O
         pbgmCF7QFfIdYCCBL8NJT9AFJcbdo941jR9IdspsY8YSqC99jDHh5RfzJ7qeJeXiDaci
         EwevvqPovquJtGYNyfXKIWMy8YWSB8FWqQe6saC4zIvh2RMwJH9rLEGKVxvpHZLygYNG
         5P6m2r9LaXx/Wx+50MYbJaiBTH4FaAo37KmGQqZpwlP9R/fu+R+fv2qBmwvAy8y0muZR
         Q4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427166; x=1793031966;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NE+y3DSsi5rykR4670p1tFrN+yLiaIR6vwkREYtVCfo=;
        b=TK6WxMfsmmJZVfrOdlP+O0pvqsPWvBxe15rDCRJKqdT7Q1ixj26H4aD5ZaD73cuPmJ
         4a/VjshUqLt6RR+Tdil2PdRIZm3768h4RXYrcs4DT3KriCYa2MN2+t+tM6Ms7//zQ4ru
         VzMVmHzwOu0ABaYoknzkocUs6vhO6ASkKYdLgOZDYhmIAYhgnLMzGdp7Bf+s88s6b1Xv
         kJKgajWfH4MKIeHHzMfR83d2mL0lp5U4cQndb1eRlDjVfv5u4UCIfWB6oLonO+iwQ5Y8
         GgkGLu8OucSbywR/ebSc1MM7FMfTfPIAgudfOQ5WfvtTbFFlaX86BnAiw2l0j9Q647YR
         +YMg==
X-Forwarded-Encrypted: i=1; AKwUvBwgsK9AZps9ZWHttLH3gXsFNkpoDI/DPg6JOKM7o8mFg/EEQCM+QmncFGZrLkDwx2Rkah5tRmo9pZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBxoafE/5bc4WZP7ln3UY0AD86j2xiRD2vBrh/UkouDQxQ6KCA
	edrxqitvkFSnTjt6tlZZMlqTSWK/Ktj8dlZxjBe0NmihkqKh/TznugQyir+yro6UDGBrobffIE8
	xiwL4Ea9JNaFZNzxQl8Ru46L0r9/fZpjbnS9XoPQuNI8s0udsLWT6WyHPGDeEMg==
X-Gm-Gg: AYBFou2xf78lP9BYvXXdzovCkxkPfUIZuS1gCyT7F982ZQJWueWbw8QGRh3qGj6SLOu
	8hw9HCnk9onCEAxZTQuQnlHj/PZBo+9su4nPKZdhpgqRPnmIfnSSbE51vYZZ4E5XSXNAfzHMQ7x
	0ytAY9Kl3fs9TcVn65bAsr6FuEOsnEyzSgz6CU2FwjgcRTZFukVc/h0hpryu3AwdGg/6Vc7LZKj
	eUBCbsc5ReZsergDOZbA4NEnLKP+E0KYT+cjDKN6TPcGLdLeqBZ4olsWAJuq+0uavzMts6pW6AR
	pRVA/cgY5W9ipWd92j3MeHPvUOBcR4A39V3BnE6ep9X/IwSH6FZoHwix3AmOy9yygHTKHNs=
X-Received: by 2002:a05:620a:2609:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-93f29d9614cmr1410129085a.62.1792427165997;
        Mon, 19 Oct 2026 09:26:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-93f29d9614cmr1410120285a.62.1792427165329;
        Mon, 19 Oct 2026 09:26:05 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb756c6sm102432276d6.43.2026.10.19.09.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:26:04 -0700 (PDT)
Message-ID: <d4646cb758e669b33aab1408b94f0102178e13a6.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: lyude@redhat.com
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
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
Date: Mon, 19 Oct 2026 12:26:03 -0400
In-Reply-To: <as4xMnT8a75pIw9v@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
	 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
	 <asz9AeFe3CutP73z@gremlin>
	 <20261013123132.GC4214@killaraus.ideasonboard.com>
	 <as4pAEnLd4H68W4W@gremlin>
	 <20261013131243.GM56180@killaraus.ideasonboard.com>
	 <as4xMnT8a75pIw9v@gremlin>
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

On Tue, 2026-10-13 at 14:29 +0100, Lorenzo Stoakes (ARM) wrote:
> Anything that looks schloppy. ATM it's very easy to tell.
>=20
> In future it will be newcomers who do anything but the most trivial
> work. Or
> they will at least be super-deprioritised.
>=20
> Yes there will be collateral damage, but it's that or no more open
> source (we're
> not the only ones going through this!)

This seems like a huge leap. How exactly does expecting people to
document LLM usage mean "no open source"? I had very little issues
getting people to actually tag their work, and these tags have been
immensely useful. All this does is offload the work of identifying slop
to maintainers.

