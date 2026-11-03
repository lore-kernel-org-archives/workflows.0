Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706820;
	b=M4xhpRN2ExStmcemwI2x9U74e6lOZYPX5ffohDI8HRuXmkHpqvgHSNBOoUaV+8HB3PPr
	 YXKOoFCUTkTjrScfQlH9EA76kfgki8sf1B4BmY4yMlvpUjy6KQlSDHjDuD3HGOvfut3/c
	 5xiHRNeeSVYxHwmFPCqj+GKIKp2NGoDPEbdSHOpGgA0ZkVgc7Q49YUwkkk0ZnxsVThXrg
	 SF4AxbNuGowgqhLbin14m4PG4mvI5RLH3yFPXyqRVgFC8BarG+FDR3tO9tebHl970vnLN
	 83VLyv0DzdiWbOMv9lj09qXJJFUX+G0GQS10lnVC+ZGkF5mLr808LRUzE05izpc791A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706820;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J1VZgX116yiDi0nv9m0RSUyvLqFAqnWDdWQwCFN1ndQ=;
	b=V2qA7BJQ8Icsf2LQYcSSwAe8e+cgCzko4eXsPajR0hmpHf1MWW30yxdM40IlthxnlZf+
	 MtGf9XZKlnjvjCL4MHXeS/PNbSeZtOcw94/rxOR1C0QxN5ErzZbOdK2e/Yk/VkSr3cndb
	 KhJsFblwzDQtf81+rqNZUHcYF3KNQ+6l78ln0/GtXHnLO1d03feNJYn28oydCWIUSRDt+
	 h7of6lJfFmLhsUbxw1gJVOL/xtYHNFO88kAzS5//d9T2G+h4Sae8jSGGihOjYEY9jNMHY
	 bvenLSn5LydC5viMGF3IpJDQR57bnxVFUYpDfO5uU8uDtJ2oa46wbFY+BTk2cxBVyzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RCrZ5VBk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pxkb3M5+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75820606A327
	for <workflows@vger.kernel.org>; Tue,  3 Nov 2026 11:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75820606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RCrZ5VBk;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pxkb3M5+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793706818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1VZgX116yiDi0nv9m0RSUyvLqFAqnWDdWQwCFN1ndQ=;
	b=RCrZ5VBkeJrEI3zpbneAS3YtxrvnJPz6jqN9FRXDVhfmLLcvfaSD23oTZTkgtK3jYosBNp
	EpAyzD2gXDZbssS7VwbzQq1WwdmvqGkLPfMAMixeF5l1effholsv0LTKsYmYX7C495MF4E
	xp50fcQyPwS5EKnGcvOp41O1SAp9Ilk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-14ajrQiVMKWS-uJWfUcGhw-1; Tue, 03 Nov 2026 06:53:37 -0500
X-MC-Unique: 14ajrQiVMKWS-uJWfUcGhw-1
X-Mimecast-MFC-AGG-ID: 14ajrQiVMKWS-uJWfUcGhw_1793706816
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49953abe51fso19504515e9.1
        for <workflows@vger.kernel.org>; Tue, 03 Nov 2026 03:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793706816; x=1794311616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1VZgX116yiDi0nv9m0RSUyvLqFAqnWDdWQwCFN1ndQ=;
        b=pxkb3M5+jKJ5wbs7oU3smOLAJR0B6GAGF9VJp0Mw5ip2B3kaMRwLgjDffBTnG2qcUf
         ANIa5eg2SRqOJETfufTBcJX9VTQaNkW3IGztKG66tFWAMTnDwcppPhNfzU4ZoL3YDlJj
         tZEaoeJ+fH0CHa4PF7RoIgk7kTPU5PIHeCTtMoNI7+8qwTm2pKMXdrjTveTCE1f5ZcLI
         XUhUzHC6mLCYmeVA8fiqsNYtSbMrgNaC0fZZ7XDNQDhp39Mc8BrbOBjYXDuydC5+I7Vs
         aKkuTmCNJzm9b93gICtBr+0b81E2MeB0eSuliOJOuV94rvAzLZdR6O2IrrF3vQOO+dSh
         d6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706816; x=1794311616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1VZgX116yiDi0nv9m0RSUyvLqFAqnWDdWQwCFN1ndQ=;
        b=L70K7gu+XCIbHtw5NXqQxzvjqwpbwZyeBG5S2kEgUPVF27GNFU4zrYxup4eiD7vksl
         7flc0mlYJ1HxrVrO3fFWd+HpRViYRqxV6lqZM2s7KEBvxzvXXPQhHux0gLN+l4Z5hQJB
         dOFst3YqX38+RneLfhQAKu6giPQ3O0Z9v5ZVq83n0p05DubpGb3AJTbnEqOHB5YMchnR
         1mX7rdUmnZGh+aDxgvLmG/j7dlvsiiLhJTSdmyPmsd8paJgD2JjpDAn3jiMF4SV+PVsg
         DIcHj1kDCC7sLQL9zZw+AsVTKqDR5pdo5mIGoozFrPPmKkJYh+Z8DNNaIRoZdskeAZPa
         ulVw==
X-Forwarded-Encrypted: i=1; AKwUvBwv3kvCghX6+IFsDpRP+DyDHQi9cc0NncuiZTDsx0Ke7O2Huc6Dmq6geAKf+qm/eeAhbzK5NvnyVEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sj/BW2TgEuARdkrbzq45vqlKNW94izEvXrHkwbIOEMC4yPAKg
	pNnuPRE6aovS8zYdzjvf8kj79yjPJaFHv5otIPtt303KnLoVgTK5A2VXj8zi6z0RbA/pfzFflhL
	L4pVN61M5VL2mIJSORIp01BRFHi2yjNNi8eo1kT7+HBRqERjow8Q/3NaG37JWmA==
X-Gm-Gg: AYBFou3s4FifiylImYbQtXguxyR6NPglNb064YTDTUPHSKIdg4gByuaBh8iXFWQu2IA
	69Q3pFQWdmniHnE9z2rmsxh7mjNcZhw4xk8CLbX3UaOcRE5fcwF3t1YAaOKl17saP5dG15BZ0b4
	O2m0hldAQVYwjYcPnPisSP3yPDUiPa6hyN4qGE0HQzLfR1hllDJz40FWlkeOiqYk/2FKgxgjmQM
	P81izugliRNj6VQ8lgPhWUr3rQOd6eTrjaiKCSvGhaUE9HyqdPNJd8gUrRA2/XFTN0cTTyyGaAf
	/twjn1cTNv3CISqsF2fqweOMk/FNo4zPL9PuxIBb5L5S5DgadtSwR8WKUYCCA2q4faSJ2TOt/Yb
	Ano8JTF137rlcVIe9pv81L5JxVKoJFRYAVhsuuVkaba0brf4/LD6pSL/1cxUT7ww5J73+xKpTAO
	7b20JRVZRB7WfR+0iV+8xsky5B2/QM/oBSSGI31VHHOak=
X-Received: by 2002:a05:600d:8082:b0:4ad:181a:4348 with SMTP id 5b1f17b1804b1-4ad181a442cmr198293805e9.18.1793706816233;
        Tue, 03 Nov 2026 03:53:36 -0800 (PST)
X-Received: by 2002:a05:600d:8082:b0:4ad:181a:4348 with SMTP id 5b1f17b1804b1-4ad181a442cmr198293465e9.18.1793706815812;
        Tue, 03 Nov 2026 03:53:35 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm446661025e9.1.2026.11.03.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:53:35 -0800 (PST)
Message-ID: <02113612-0c7d-40af-8eca-043f5801d7ad@redhat.com>
Date: Tue, 3 Nov 2026 12:53:34 +0100
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] docs: netdev: try to force agents to disclose info
 for fixes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261029153459.2257998-1-kuba@kernel.org>
 <9A74CA14-D4C0-4252-A3E7-256F9626B513@tipi-net.de>
 <CAMuHMdVJVxpX6OLVpE9K9CDY5q61A2rFGf7FpUjs7xpFwReEzA@mail.gmail.com>
 <20261030093418.2fbf0999@kernel.org>
 <20261030164758.GD2673734@killaraus.ideasonboard.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261030164758.GD2673734@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 17:47, Laurent Pinchart wrote:
> On Fri, Oct 30, 2026 at 09:34:18AM -0700, Jakub Kicinski wrote:
>> On Fri, 30 Oct 2026 11:58:17 +0100 Geert Uytterhoeven wrote:
>>>>> +Coding agents must refuse to write the commit message unless they know
>>>>> +what discovery method to include.
>>>>
>>>> Maybe make it more explicit, as the sinfo bot will ask it anyway:
>>>>
>>>> ... and whether it was reproduced or tested?
>>
>> That's already in the existing text?
>>
>>> Which is true for anyone, not limited to bots...
>>>
>>> Do we really need "different" guidelines for humans and bots?
>>
>> Looks like at least a half of the commit messages today are
>> bot-written. With the existing guidance the bots don't add
>> the requested info by default (presumably since they don't
>> know the information). If this patch doesn't help we may
>> need to add our requirement to coding-agents guide.
>> They seem to be reading that one fairly reliably.
> 
> Is there no way this can be tested without being merged upstream ?
> Tweaking documentation in semi-random ways in the hope that some of the
> changes will have an impact doesn't seem to be a good process,
> especially if it's to work around defect of tools.
> 
> And unless I missed something, I thought there was a general consensus
> that documentation should be written in a way that doesn't reference
> agents specifically, as the same behaviour is expected for all
> submissions regardless of how they're generated. Has that changed ?

Please note that the networking subsystem is consistently overloaded with
AI generated contents. Just to give a randomexample we just received ~60
patches from a single 'newish' contributor all violating the above prescription.

We need extreme measures to keep the ML somewhat manageable.

I'm going to apply this one.

Thanks,

Paolo

