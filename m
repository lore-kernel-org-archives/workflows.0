Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B3020012D
	for <workflows@vger.kernel.org>; Fri, 15 Nov 2024 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731706914; cv=none; b=c5W88W8NVO5/LDIhuvB6Anio1g7ObE66bZwP3uKoREB4H4iE9PzhCR9mM6dpsp0DI/uo4A7Qt0NPiFRU4xpCyP0DUGMns2BiEbkApmCMe7ahE1eVZM4NhtQd6d72szPyzB6nA+nGzsxAdWXMDrqkRdqhBMXXtWVEenm8SNpNN/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731706914; c=relaxed/simple;
	bh=3AdlVmFJUuneDLJZeDQyF43GBDnUKRUtuu8/HNdav2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eV99S2ITBGlJtyz0JUCtqtNmgxXFQPKzhBR5VtpPdkuErn6AUFvIBMhet8TUQoR4TxB6LFR1MW0CeImM4mwGCW8WQDdWST9hPKowI6nIxmD5puoZ5XMyckw2dBnVOu2TjBletxE0p4uRLUgazEu7t0FbSteRDqYn/y/EPUQ5P6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YYU9YCGc; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YYU9YCGc"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a71ea19b04so7081295ab.0
        for <workflows@vger.kernel.org>; Fri, 15 Nov 2024 13:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731706910; x=1732311710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYd8+G0gFG4tJ6lfJzgfGTDl5TfBDB+oV8M0OhnzDMo=;
        b=YYU9YCGcDr8BVlrCzNiUMlHBWh3aRwr9gs1nx7UbfyX692ugZWG5jOh/mmsnNfUg9P
         k1ff40IxOa452VErD820Cp1vxABTC2cc98UW7YS7rDNOqYQROPoKYzCD5xutv6x0Nmdh
         0zsNLhgmdMZH7k2mIqG/S8D92jIfrIK1+QN9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731706910; x=1732311710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYd8+G0gFG4tJ6lfJzgfGTDl5TfBDB+oV8M0OhnzDMo=;
        b=gbRwHJqgBSWNigu7i2rEL/7p0Cs+862ahwHO29U9ZNbBE+3gQB6r7ozDlypH4/U21M
         nMS0YNJJDux3XDzqWyGYxGa+wlnCGpdJPGWRrxhv9XIMjhs5/3+Qf0lKG7wkZN7d5swF
         acj7QSMn2vpyNzrFZTeqqRxDZhsIw7UXKlYB7nw/radzm8IhXHXecBMbdx1AZktgQnt4
         Czzy6ufBEjRtTvUVQ944cCRdS8ISXg1OclBoFg88dyG2uWhXRnpAKYDkwxcyQIDnw+ko
         k302XNOulMhhSSTPW6v9QrORT/qhBW1Y9uzZtPbqJ5ECpbnOgx2iPDL7WllAXWW02wLT
         uTnw==
X-Gm-Message-State: AOJu0Yw70hEnN4pw49t4La1jzdIYKAHqY0ZdmU43l3VUeWIBJsqqQ/Cv
	gOQlfcOI6oNzq+u9lYUhZwwudGDMynpMqgwloSYzoH/AlqSy7Y9QF9mrz22vVbE=
X-Google-Smtp-Source: AGHT+IFgerhBT8HV5d04ucMvvgI/7pziUFkn2Ra+h2/ivSKmVoAJ6ZljYPTJZCWr5Epz7Pfq5Rv9bw==
X-Received: by 2002:a05:6e02:3890:b0:3a7:1f23:1a46 with SMTP id e9e14a558f8ab-3a746ae37e9mr49252445ab.0.1731706910327;
        Fri, 15 Nov 2024 13:41:50 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a74807f0f7sm5235255ab.23.2024.11.15.13.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 13:41:49 -0800 (PST)
Message-ID: <0868e182-aa37-48c7-9dd0-ae4f6819c71a@linuxfoundation.org>
Date: Fri, 15 Nov 2024 14:41:48 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Documentation/CoC: spell out enforcement for
 unacceptable behaviors
To: Jonathan Corbet <corbet@lwn.net>, gregkh@linuxfoundation.org
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rdunlap@infradead.org, daniel@ffwll.ch,
 laurent.pinchart@ideasonboard.com, broonie@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241114205649.44179-1-skhan@linuxfoundation.org>
 <87ttc8ji84.fsf@trenco.lwn.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87ttc8ji84.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/24 14:32, Jonathan Corbet wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> The Code of Conduct committee's goal first and foremost is to bring about
>> change to ensure our community continues to foster respectful discussions.
>>
>> In the interest of transparency, the CoC enforcement policy is formalized
>> for unacceptable behaviors.
>>
>> Update the Code of Conduct Interpretation document with the enforcement
>> information.
>>
>> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>> Acked-by: Jonathan Corbet <corbet@lwn.net>
>> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>> Acked-by: Dan Williams <dan.j.williams@intel.com>
>> Acked-by: Theodore Ts'o <tytso@mit.edu>
>> Acked-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>
>> Changes since v3:
>> - Modifies kernel.org actions as per Konstantin's comments
>> - Adds Konstantin's Ack
>>
>> Changes since v2:
>> - Adds details on the process leading up to the proposed
>>    measures to seek public apology and bans for serious
>>    unacceptable behaviors.
>>
>> - Hope this addresses your comments, Daniel Vetter,
>>    Laurent Pinchart, and Mark Brown.
>>
>> - Would like to get this into 6.12 if at all possible.
>>
>> Changes since v1:
>> - Updates Acks with Ted's ack.
>> - Fixes subsection formatting as per Randy's suggestion.
>> - Fixes a spelling error.
>>
>>   .../code-of-conduct-interpretation.rst        | 87 +++++++++++++++++++
>>   1 file changed, 87 insertions(+)
> 
> We seem to have reached a conclusion on this, so I have applied it.
> 
> Thanks,
> 

Thank you Jon.

-- Shuah

