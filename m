Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF44B7A4A
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 23:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933697; cv=none; b=Gj8UXZTncElcf16zoi1EmLXvdm3P0n3jLKhN9sgnLYwZbfIxxVLZJBcS2ZLcv0mU0/7YEq8UAf8u9ASkhlBRE/e2zh1sxNnJy4j+GZXWttUhY4sDwbrmCwY8r7o2uisQVnMI3cmI3xCicE4VnWZsfXq9tbLhctSQ4Jy1eP/TfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933697; c=relaxed/simple;
	bh=YpYcaWh0KIflGOrkZMAUIYxjLmPA0tGdPrYySTXI7nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcBnAUmmiUTEQ7H9huwpPvznxmq+O7FxqmJKUWeij1pNSflg/amjvDg7AmPxO0anmXSoFtZkAXSzieoC6f4lY34UkHY6N3Q6uHTwRYObUwsJqmoPzRAuYSSopsBh0r1UErTLS1KoSj3RRmIs29LlzMkx+ola5iFMZBNdh9Cdq8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y2fzAuDG; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y2fzAuDG"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df1eeb43feso1496751eaf.1
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 16:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791933689; x=1792538489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEfNInTJuE3aJByZQc0toWYnu5gzVMqlQfVYAu2XYhY=;
        b=Y2fzAuDGHePoKxdfXcC5DoFBeyZfTNRGxy8AqeGnzeYtC16Ncb0Jd6HJ+FmjW7IWGZ
         COU7yr4X9DyBYzXpJXqN6r4MpcCiLkn6h1Zhe6B+TcuMUgrQUMFw48b539Yx1eOvlKjp
         Ll83Yz77YWFmDMYv9unmyMvBNPiVen9aFTWfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791933689; x=1792538489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEfNInTJuE3aJByZQc0toWYnu5gzVMqlQfVYAu2XYhY=;
        b=S14CKgr0Wujc7LLX69bdcZ3Q5cJqi6cWjGMGc9Nbb7Wy7qz85Tr5jqxCGUaNnv5iSE
         /nbRnRCSXICaVPEksH7o/8n1DcJJrSd2tagSJwvCFuNcidC8gMhRSiqOdPuKl0nTWzqp
         rmrB/uL34WaoFdKAeqM1w9ncDjN311wflBuj5tUgB/OkVEksEY/hbTtu8OGSfDbwoyv2
         rjw81PS64Lk58HOD5qczErOeNe/NjP4B+n0yIPv3E0nCEainIHKAoy93P8atucmlf5oZ
         7YFzmBu+1dKpUuyG8/nmqxAybQjlgv5ztdB1W4bRZ7UpQN2uEUM0sjWlMCqea1ZfIOIQ
         KEJA==
X-Forwarded-Encrypted: i=1; AKwUvBwnqZIuiLxb3vyg8HmvQXCn3PXLwWmT7HfG2EN5RVeMjniQal/OOoWBb+kQCwlC11pwJ5l5KhaB5Ew=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7F+7fBq0/Oyr3IvvL+/RYCwBnP1BttAMX/bsoOqXzPyxAETQJ
	8EGAaT3efRiYsPhYf+1oJRnFfwvwWdu+wIB0ZOqR1SpaeUlP38VrtHo5HKYOkFIpIrM=
X-Gm-Gg: AYBFou0Dc8lA2lugPPpU5F/nEMRkaIM/iR+IlhzZAbFem8zcebDgjvpQLei561N9o/a
	Id4Dy2jgaddQLv/ptXLsmA5tfndNXXWMvU2CqQ1wptDcabvVVggxA75yFXYsybRML4an2BYjOnb
	t5/OUA5piNauNbPC3MDy+AagbswGuCEBspmGlVe4JbChQNbKBrtAanja8dVrb75LJtiQEdvC3YM
	POQ5D7LFaj/XDbs9JQXXewLZypFy94aN4RL8py1RgUhphqsDyr15ZXxsBiRHoONi7tR9sLfow64
	utjxIp7GG1ufbKviASRRCLo1mF5Bh+Mq1o5fxsGxMLwIOpkND4Ds7J08LQLIeQ4LjOhXyB7zImV
	DVFmWmFGl70S6ckJJ2Y+wc7tzoEmSAzwxiLiQ+3fXLlpZYF7lrHv90elzH8jymD25Kew9XTfAaO
	vAAsNmzX8WrjYx8VGIFGiKKg5erWUGOVUcka7n+PtTA1Ftacy62hAA4pXC8yN1BHGyaXxdTGwZe
	EO+hQkb
X-Received: by 2002:a05:6820:3392:20b0:6f4:622d:4fe4 with SMTP id 006d021491bc7-6f4622d5cd0mr4215967eaf.24.1791933689221;
        Tue, 13 Oct 2026 16:21:29 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f56b25672bsm6940770eaf.11.2026.10.13.16.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 16:21:28 -0700 (PDT)
Message-ID: <375451e1-a960-49a0-91e8-26afe5c985d6@linuxfoundation.org>
Date: Tue, 13 Oct 2026 17:21:21 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: remove Assisted-by references
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Daniel Pereira <danielmaraboo@gmail.com>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Linus Torvalds
 <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Jeff Layton <jlayton@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Brian Foster <bfoster@redhat.com>, Carlos Maiolino <cem@kernel.org>,
 David Disseldorp <ddiss@suse.de>, Jani Nikula <jani.nikula@intel.com>,
 Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261013121501.3738437-1-sashal@kernel.org>
 <0dbd9197-3fce-431c-9874-926f03f662f8@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <0dbd9197-3fce-431c-9874-926f03f662f8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 08:47, David Hildenbrand (Arm) wrote:
> On 10/13/26 14:15, Sasha Levin wrote:
>> Commit 78d979db6cef ("docs: add AI Coding Assistants documentation") asked
>> contributors to add an Assisted-by tag to patches developed with help from an
>> LLM, and commit 816d9992d9ed ("coding-assistants: simplify attribution") later
>> reduced the tag to "Assisted-by: LLM".
>>
>> A proposal to drop the tag was turned down in July [1]. The main argument for
>> keeping it was that maintainers wanted a signal that a patch was LLM-assisted,
>> so that they could review it accordingly.
>>
>> The tag came up again at the 2026 Maintainers Summit [2]. Roughly 10% of the
>> 18,533 non-merge commits in 7.3 through -rc7 carry an Assisted-by tag, while
>> actual LLM use is far more widespread. Some contributors do not know about the
>> rule, others leave the tag off on purpose, and few maintainers ask about it. As
>> a result, the tag does not provide the signal it was kept for: its absence says
>> nothing about how a patch was made, and for developers who use these tools for
>> almost everything, its presence says little more. The choice was between
>> finding a way to enforce the requirement and dropping it, and there was a
>> strong, though not unanimous, consensus in the room to drop it. Greg
>> Kroah-Hartman, who argued for keeping the tag in July, supports removing it now
>> [3].
>>
>> Maintainers do still want to know how a patch was created, but the view at the
>> Summit was that this belongs in the cover letter, where it can describe how the
>> tools were used, rather than in the changelog.
>> Documentation/process/generated-content.rst already asks contributors to be
>> transparent about tool use and is not changed here. The rules on the DCO and on
>> the submitter's responsibility for the patch stay as they are.
>>
>> Remove the Assisted-by sections from coding-assistants.rst,
>> submitting-patches.rst, and the Italian, Brazilian Portuguese and Traditional
>> Chinese translations, and drop the handling of the tag from checkpatch.
>>
>> [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
>> [2] https://lwn.net/Articles/1099594/
>> [3] https://lore.kernel.org/all/2026101327-cupid-legal-6cf6@gregkh/
>>
>> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> Reviewed-by: Kees Cook <kees@kernel.org>
>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 

Acked-by: Shuah Khan <skhan@linuxfoundation.org>
