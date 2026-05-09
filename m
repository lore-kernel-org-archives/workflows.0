Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE61C35E937
	for <workflows@vger.kernel.org>; Sat,  9 May 2026 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778356299; cv=none; b=I/5Jd2kQuJKY04WR0dzH2NRg26+MW6OIgvsJ4MyAQJlu1dIAMszaZkGlBxlE48HSAxzXfbTf5HpkE2gPWOUWCwW42L2buHJpxvqi2x5aYiXLBYi/Dga1beaZN7FQb2xMP+NyXwEb41dN53qV336qQL7sZt/DsXqYY4ThD+KLcIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778356299; c=relaxed/simple;
	bh=WeeDw3T0vf2f1cVZ09Osp1Jr9x5HzriJwV3oiDr676Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAV9rUyCRmCpns6Hejz1oudKdUJh4aXYgdnMuSpACg1GX7Ux/LIy0yfIJ/sGObIv14pA3e7MzgH3vjdXGdwknKDhn8Tc3MtjAXD38QtXtjr3CjZtUPShRbV0ppKW32lc7EawntCcS+4TD5O9m7KQdOxPCfn0yO/i1muuRXnm78c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eHX4oH04; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eHX4oH04"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dbec19732eso2728283a34.3
        for <workflows@vger.kernel.org>; Sat, 09 May 2026 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778356296; x=1778961096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C15JMNsq1tgH3fZ4/mFGus9TyKubmrs5U3aY7mNquk0=;
        b=eHX4oH04fKvrGn83OyT/CU0kku29TCf3f4UZ2zcLN0TP2sqoSwyvbczyawhTaYRFkt
         Jkm3KN4a3D/YQOEuIs+nNkjRnb2GY5xjXv9Wl67st+MTSxL+hN3CMvT0M/0hhBIQpwV5
         3oWfkSD0hW1Jz3u463Q0PTM+jCjAmIx12rj9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778356296; x=1778961096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C15JMNsq1tgH3fZ4/mFGus9TyKubmrs5U3aY7mNquk0=;
        b=MZnp/OBQXi+oepdWK5bzlhag/ICSgdC8y4gxvcLZj0g2NvkLS5Xz5SNKCN9Q/pb5Ng
         UUZS7qeyyGI4qgq3gsHlMm+Xd8WtcKr8yPFQIp6XIBufp5+9KMLokW1isMDspfNx15c9
         N2iik/9ntYa7N9MS/EP7HGv31hn2Af+sym4MlLRuRxRqjVFX+Bx1vupmgz7VUiT/7dow
         qegB1RTzwcxkraMEpg0tPbIFSBzL1Tih2wkb3be109c5GobLJOZfI9tCjaMsWm/u7/+Q
         8TWcmgcc8MIwZ7KNJ+6fQMm7M4k3aOnSY+6+ehTf2elnVwdcS5CdvbrZyN2HCIOq4X7p
         OKMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vLoPeF6I3TyflwE3YZsWfSynoSFntbRSpSWIG50mt8MHHk8NBfD+3CTPmRRjej/qeNPoxSaiM2wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtRpciokmzbz+uvVpI2JRcIxtLKOWjl9Pp/CsdvoLe2OYucdnD
	SD2BPK0lsB/XfTVveVdxXgVNjl99lZBmuLCOrXK1Z7xXX2MVvsM/I6mROymRztDxOww=
X-Gm-Gg: Acq92OFwVNx7lK/3ZWo6nHSCXHR+QnuDqA1PdJzrsEI98EhY3RazuutoSF+Im8XGeMo
	3Rjjn0hIMWpXa52atnd9WGjAIhfMEsgt7i+yznt8B15gALZz1zJ9XmgfB7Tak47P88sOQSbs2UT
	/RF/nozIBxlaehgrH20+oO93fsjZc1Qh8uMGLSo+9SpZZacB5Rck9lCMHfDaJCR995a9tb4jEN4
	cGHMRkp91oOsesI1aY8hpQH8y3NXwrpdLUgtsACLfe6+JmOrUmA07/BrwrregfNzBuPrcWgXWyd
	YSBO/hmVQavx5vtRxJd/H9Xg/yi5Pj0sFtg0Hhc8nZrBsbRxBIdlwB2tygiDn3z/a1HOuFDdkc5
	mLyH8om48EYCqqXyCSF6UqbdEdtvieWuIpeL6cBSx7ZTduFwujr6o5/YgCnacuzwPBrYjSp7+aF
	gyPbaUT88fdFQaDa+JV9Alu7ydYdHz1nc=
X-Received: by 2002:a05:6830:6d48:b0:7dc:d0cc:922 with SMTP id 46e09a7af769-7e1df194678mr10848577a34.27.1778356296654;
        Sat, 09 May 2026 12:51:36 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43557109b67sm4987397fac.6.2026.05.09.12.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 12:51:36 -0700 (PDT)
Message-ID: <af11b090-37dd-4cea-ad84-5e29fcb3e8a3@linuxfoundation.org>
Date: Sat, 9 May 2026 13:51:35 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260509094755.2838-1-w@1wt.eu> <20260509094755.2838-3-w@1wt.eu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260509094755.2838-3-w@1wt.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/26 03:47, Willy Tarreau wrote:
> The use of automated tools to find bugs in random locations of the kernel
> induces a raise of security reports even if most of them should just be
> reported as regular bugs. This patch is an attempt at drawing a line
> between what qualifies as a security bug and what does not, hoping to
> improve the situation and ease decision on the reporter's side.
> 
> It defers the enumeration to a new file, threat-model.rst, that tries
> to enumerate various classes of issues that are and are not security
> bugs. This should permit to more easily update this file for various
> subsystem-specific rules without having to revisit the security bug
> reporting guide.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Suggested-by: Leon Romanovsky <leon@kernel.org>
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Reviewed-by: Leon Romanovsky <leon@kernel.org>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>   Documentation/process/index.rst         |   1 +
>   Documentation/process/security-bugs.rst |  38 +++-
>   Documentation/process/threat-model.rst  | 236 ++++++++++++++++++++++++
>   3 files changed, 274 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/process/threat-model.rst
> 

Looks good to me.

thanks,
-- Shuah
