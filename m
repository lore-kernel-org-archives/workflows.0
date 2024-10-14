Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868861553AF
	for <workflows@vger.kernel.org>; Mon, 14 Oct 2024 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728947395; cv=none; b=RnFBvKVXPlAoB8rNcr4nsfjR54Z00zZ3FJlymjApehfjgDcZp1oIv6vQAj/jX9QPwdUp2a9g+n26TKsTO10UaXXlyyYaOPuuhsv5d8vcah/uOXk2e4DcU9Iq7HXDMqRfRDTSiF6ldnZijLjInU+jE7WIuWOPFksQ3x37l/oSObI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728947395; c=relaxed/simple;
	bh=2W9U51HFCbv7j87Iuu5EH4EN9DG+WFYTYJDe/09T/Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxWIz/ofAzkG/yi4ezdJcFtqS+9+EpOeZf/CsGhm7F8fNHtu1Crt+KzUQXb0X7OpCfl0ejTQjMwF5isSIVXQxZlaN/RuoNe+3WXLIrG9LJuOThQROwbD3xqA3b835VnEYjnhfOyxztoVEeAy2ZNCv3d6OQfNkBvY6gqwM5Xr7Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fZyN7ZsG; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fZyN7ZsG"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-837ec133784so122159839f.3
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2024 16:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728947392; x=1729552192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpXjF7UCLh0jKlSUonkPW30j+SOb0QTOKoVf80FL/mU=;
        b=fZyN7ZsGn+kSFiAGe8V6veih4bkpkVJCb7krdCaM/1R+C0ELeGaNPXzRC8GcYVMCp2
         PaDviC9nZWOzDegyHjP5+VKbIWMTQDK5cberiN6FTiBynnXqREZRA7nTPfeDwz4OdNab
         xBkRSQCw2qobleShJZt4kDeuZE/Lv68rTNWSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728947392; x=1729552192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpXjF7UCLh0jKlSUonkPW30j+SOb0QTOKoVf80FL/mU=;
        b=v5JyymxiLsAnjjhz5Co/QRDXL1uFuZERC/xW6TadW8oDAf9Fn111a6CEuaYCahNsJO
         uh9F5iyX6B179Iq9E+czbn3IjLtvukBO34oTwK5WU9ffvgJjwbVSc35Ts7kcZCucEVut
         Mqf0drDO3EQkDTD3T5xotl2zI0Qc8ebFS4j0r+s0ddkm5GjNBS8R1RZY8LLwQEgEK/ch
         b0yPtMYgGHKR9aaQyI8UfdkEO5kabtjRv2vsg2qImT/admZ9beDyNIEaTdCd+V0peLHE
         Rb74SUMeCjZHRM2Lirye1B45rZY8jkNbGq6L6jjKtS9VPx5tP3rSk+4CMJZT+dC5Fv8R
         EA1w==
X-Gm-Message-State: AOJu0YywzAAeK07mH5U/IsgCGRr6XFCwvPvBm/+23IVsly7uiEsvlkDJ
	R4n22K+h/S3wk6lSliywfK5Ektk5rD9II2FX6CdNQ1L7CuLYNrb9dz2AbSbTypg=
X-Google-Smtp-Source: AGHT+IFyst77YQycrhwr+AWjoTAU3OPwbRAlI53NQc0Q2J1nk0Q9X9K3CFRSn81FdTsHv6oZeL5JoQ==
X-Received: by 2002:a05:6e02:138a:b0:3a1:a163:ba58 with SMTP id e9e14a558f8ab-3a3b5fcaac6mr100716465ab.26.1728947392619;
        Mon, 14 Oct 2024 16:09:52 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbecb3a424sm29943173.101.2024.10.14.16.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 16:09:52 -0700 (PDT)
Message-ID: <9e75fba9-08aa-439c-9c26-a4f50a9a8372@linuxfoundation.org>
Date: Mon, 14 Oct 2024 17:09:51 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs:process:changes: fix version command for btrfs-progs
To: Nihar Chaithanya <niharchaithanya@gmail.com>, corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241012141425.11852-1-niharchaithanya@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241012141425.11852-1-niharchaithanya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/24 08:14, Nihar Chaithanya wrote:
> The command given in the changes.rst document to check the version of
> btrfs-progs is:
> -> btrfsck

Just use spaces - remove ->

> which does not output the version, and according to manual page of the
> btrfs-progs the command to check the version of btrfs-progs is:
> -> btrfs --version

Same here

You can simply the change log to say the following:

btrfs is the right command to check btrfs-progs version.
Change the command to check btrfs-progs version in the
changes.rst document

> 
> Add a fix changing the command to check the version of btrfs-progs.

> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
>   Documentation/process/changes.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 00f1ed7c59c3..82b5e378eebf 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -46,7 +46,7 @@ jfsutils               1.1.3            fsck.jfs -V
>   reiserfsprogs          3.6.3            reiserfsck -V
>   xfsprogs               2.6.0            xfs_db -V
>   squashfs-tools         4.0              mksquashfs -version
> -btrfs-progs            0.18             btrfsck
> +btrfs-progs            0.18             btrfs --version
>   pcmciautils            004              pccardctl -V
>   quota-tools            3.09             quota -V
>   PPP                    2.4.0            pppd --version

thanks,
-- Shuah
