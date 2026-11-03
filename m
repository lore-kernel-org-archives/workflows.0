Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793712981;
	b=d3mG0lWsQyYH43efvT/k5jSCQ4fBJvcMolyBS+TucWOdw8+8rAk/46jDsRtPhDzGfBPV
	 hIL6q3yLfzwHxYwrD/d66yBOEYXysXqMWUHurreDdUdz5Up7K+bWAHxChsymfyAxUu79h
	 4uA9DiUKbS9YlD+UafTVsk60Mv02XYo3AkbltseYOqbMvigJztiCwgT88Z+ph/ssoMGYP
	 gQgdvjAcNgueSBhQlPRr3P7L6j5LFauRU+4qJBUBCP1JRFdR6bZe26kcEtwSM5vCuMXJY
	 fMJmN/685i3MdFfMSKvoaU95wfRWFpOZo4P9L3rdOkAofsaNA+84fsehbghp3wHlcyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
	b=l8xV7HViqV2/syfD4iVtuonKgds6QAUSPnM08dWn4v5yr+DZd2LmZ1S8qb4BFxLmvBN/
	 aTW9PSnYnxk8Y/Lc/33bIWQvczeZvBxMQfywkcvyWEkeh2PE/kxu2OK+suzAVFtlDx9wy
	 1+XqIw4sbllm0Xhq3bTBynQbt6JI48g0pHrAKWCyWdl8IqeDT7TvetplHUQoOjBwFqfRp
	 IYatnwhW57iAzf+EOscVcFieB+Pbunai7jRP3UXFaLHLYsb7wmqefdHIn6xDhGcRM0Xi9
	 EJo3nYWH+/82+6lPYfISA8G4+30KoWf0MiFIx4KiELIA7WZnDv2sS0U8X0ezOIBz1mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTiqMTLG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7021C606A333
	for <workflows@vger.kernel.org>; Tue,  3 Nov 2026 13:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7021C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTiqMTLG
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c719669a8so44373656d6.0
        for <workflows@vger.kernel.org>; Tue, 03 Nov 2026 05:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793712980; cv=none;
        d=google.com; s=arc-20260327;
        b=TfFLB0FVYXL1MYa1yoCeqkPz1VlhpWlfZ9IWNsUWYkQkbK1W38byrg5ilmdnAs377g
         yQLUSK1qAiJkXFFIdrigRm4BODBWaQ93CcbA9hTieEN0TvN2AGhlWN+MhOPBhPxPaEtK
         uDR165vL9giyF9hxo9FWhFYs61onIMZNFa/zlK4/IBqf52QD1tLivLiPdZQ/9CTfYELX
         WM5h9YKcEBT5A/T/t/cO+7SCpFW/RPyTULK/7Mgw5K99uTm/e9MiYyfkbzl14xKoOdwk
         66CpYlZwfNTHGVKql5KanxdN6stMyso729+b99DDeoTKGLOHigA0uJ53C5IVTlbAzzS6
         XRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
        fh=Iky4N6IgGyx8WE94G1I4XaKGVTVwa4L75JVlqTDuuA4=;
        b=RyR/Ke1kgXUquQX3EEFmCOVJOivJszA4XrKdylId+DJ/pFQT9xdTyT+EA2isNqANiY
         JVj3j9ZapnFRe8MJ44Ycr/YbsEs9wkiE+wKdt0UZEpiVoIrq5au4/OD7xdougWFn/o+/
         Iz8Ma+0tztNfx5KygDmHRXkiaLYImdnuNqiFqKsYKcLJlH7q8gKxK0BUhrDEtf/D/euW
         jOVGmXzpYNAR3lyzzg5RgN4DnxVMGGWsxLCI7pCLAjdtlNJobZeZOxDBTdlawHepD0p7
         wnCB/KrYe36gAJ30uVse0R6koyHvSe4dCnBHGMis6R9RkLwsN4WEgioU+ooSw5pWPMWY
         xa4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712980; x=1794317780; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
        b=mTiqMTLGajkWWb+Lh90vdyb22P9zGDoS9RIl2x3eEIc2oxpQiO23S4a/09qDHuRwJC
         juy2fNpkC6uqd0BnNYrLeFxirqbBRZ1Cvg4xk7zZw8vE/ESCCvJWA5f0qD5MytDxiCJS
         I34jlBPhNYRlCzz2V+Ua5UenSvr+w5JBxV809qOwXk2X+WivVoF5Kamf/LdkNCOoCzza
         C+TmmByNYKrqCeEIhKRYZGnPi0SLgcEmFRYzQjh5u8BXM33aN3e9aV9vEuBgILrOIRlV
         8mjGwfpWBiuOaCKIRlbkjVhhuokuQb07aIiBqr8XaU3bAEpt8gJhjxIRpbitlHFFQVM5
         WRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712980; x=1794317780;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
        b=1YFhPzDof/mSoQJIcGOFWS4IU7GAJ/FCYSGJVBBdraDM1p+be07U8ce54HeJ4gKADT
         cPbIBEnWSSNyNR8y+U9eI0gicgihZijhqx0jYv+38rIlsyU7PWFL6eJVZVRdN1Dccmgz
         5BWCwAH4uwhM9j0wLZkmlgDokEAOrFIZ/HsgSOCQwRXYtQrqV6Izw/o9DA8w0CzuoDEz
         tqVbALyJKfAmLz7/0tzb2QKBQY8buvd1bXokpn3FrYjbknJ4N190edjWvgzb5v2X4K4t
         ZGorSf5V4oxTdYBM3ghszTLhzzm8EQ2zpuXJ5Be7MLOWl+gX/mkX6saydALZtlYg1w8M
         tqBQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2FqyFTbjfA7lBn95G6/f7IeMp+Uqusmjm6oPwVFh215fog3wEP/71kPK7h4l3t2+Dj5esfjTXVRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uUur2JoWcC5HTKotOW3pZFTvNVZSFbcsU6fEwbpv1epGA6vms
	PikiBmC5m9ShE2mdzxEzkGNQX3m0ZsIq3cZimd1wOXGQsZXTPktftpwocbBX3p7L77cJsNuTrjI
	DzJmPuOnf9HQpxclEMnMS+OWNddPTEVI=
X-Gm-Gg: AYBFou3TNwqUYOOrx8wDUjjzkmenVKjc+gwPyaja0sVmLTaKL81/Kb7xNp9iU1TnayG
	xpXj7UK4tVtkSRlJho7kleL2dULnZrcFJf+dSOSbff6yakfGEKm7sMXwEArbVyCrWCcFKtUCES4
	WWSPpqBSb5EIaLwHArRLxVzjVxVn1oxFx6SAmvKZ3SsXiKvta5eDaBQEa51x1TkmZKF/9We1LGJ
	zbR+lPuJRcRYvQJGvhK9E2QIrs5pdp8iFx5crv1ssxxk5qIfwjCjnKV+HMsXuwE4UV4ZY/KMg7y
	KqlOk6GchI5y1ASvi4leAZbv4Kd6hzrX/06/HtoPSXfpTsDykqtOILBLlZdLwvEYB7ReBZ+DcUs
	kcgzKMIENNJeQwMVvWvrKp+2VxbKqKbF0n7Gslap9i2eMwf1YUp2WGORGP8tZHEIUrYrYSIa5cf
	eqwg1JcRzp7rwJgDUgbJ+mNbmlwMMz246Vxf20NrOnzpLiirdnGjb5IVxu3k+D4BJomLVCxzSxj
	SrgCLV/B/VZX7e5sCu8abo=
X-Received: by 2002:a05:6214:2249:b0:91b:5d3a:f135 with SMTP id
 6a1803df08f44-91ca4b7fa7emr216830276d6.52.1793712980412; Tue, 03 Nov 2026
 05:36:20 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029180900.2912240-2-manuelebnerli@mailbox.org>
In-Reply-To: <20261029180900.2912240-2-manuelebnerli@mailbox.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 10:36:09 -0300
X-Gm-Features: AclHuK-5QE5RUaf-W6zbQ7a-8WdeKO-KxqeRSBAxVd9f-wJkyCdpMx_t9-dgL3E
Message-ID: <CAMAsx6dX8rWtX=uCqpz+LR9NDScWYLQvopDHTs_0MRVu=1qBtg@mail.gmail.com>
Subject: Re: [PATCH] docs: changes.rst: Remove obsolete link
To: manuelebnerli@mailbox.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	unixbhaskar@gmail.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2026 03:09 PM, Manuel Ebner <manuelebnerli@mailbox.org> wrote:
> OProfile has been discontinued as of commit 24880bef417f ("oprofile-removal")


Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
