Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q3U37SkJ"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A33137
	for <workflows@vger.kernel.org>; Wed,  6 Dec 2023 08:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701879681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnDM1HJKqWOdQigrGIN1Lmh2VUfuZ+5e9f0FasCk2Cg=;
	b=Q3U37SkJ4NNag0UUIYqjvFvMLp/2SJOXLGmf5U6hK1bJ8YtkpPstg/yDXc/nk6EfVDe6gB
	3dpliGBphxnJboH4qtf99oZ5y3GrJ9EwkP08VM0CNjRSIbri5ptwqmw3UtulskOevLVKL+
	Vu4/b7IKZ8qfq6HPrtduzAZa79hIYHs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-iydy3Z8IPwqayMhzTgYt5Q-1; Wed, 06 Dec 2023 11:21:18 -0500
X-MC-Unique: iydy3Z8IPwqayMhzTgYt5Q-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33343bb5dc2so754895f8f.0
        for <workflows@vger.kernel.org>; Wed, 06 Dec 2023 08:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701879677; x=1702484477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnDM1HJKqWOdQigrGIN1Lmh2VUfuZ+5e9f0FasCk2Cg=;
        b=WVrNOpXn0GkFVPInQrsl5YUF8hFrwBJrXm1voiIka+fbH1/4+vqKBSN+i+vuTyWgKp
         KX6OBodSjj2o1iXB+W6/bJFBdkG3VEk0xgKuZjgvz1BE8PBQk9RemKExHlUmzSLpuNa9
         QVySeUn3dicO+Ex1LnB6xIHz2MZ08TjHx16JFCq1Llp4xYvmftJa2oeyBpPAGGhZZDTi
         u21altdBzrGmImxPy4422rAYTnHrPHotGoknMPhEnZy49zQ2HpUa4wJJ0EZaxWLrN3Ep
         cF2lh5WvgB3ISk/HdpsC9ccgmOwYdaQnKqLYE40waUabhaYokH1LUlOMN6/4YDRHGKGm
         FMNw==
X-Gm-Message-State: AOJu0Yzv9cuUHxzeU+Wb5Pc1KIqj5rtDxNdy1kq7yfN4CCfPno7HC7/e
	+UOtgTnfkBGaQg0t5hzvce9aN4UEiWXIFHgD5tRRHiqw89z/bCpzN7CJcb3LkHiRROIGPVzEh1+
	IC9JNsQk2rSGfnROC9Msi
X-Received: by 2002:a05:6000:104c:b0:333:381d:6a26 with SMTP id c12-20020a056000104c00b00333381d6a26mr659629wrx.135.1701879676952;
        Wed, 06 Dec 2023 08:21:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0M8npnzyq3aNQOSPp1ixrdvrLxRqjwbHwEtuDDUKK7QuZkJOge4GzDtikk9SdC8IxUFmI1Q==
X-Received: by 2002:a05:6000:104c:b0:333:381d:6a26 with SMTP id c12-20020a056000104c00b00333381d6a26mr659614wrx.135.1701879676675;
        Wed, 06 Dec 2023 08:21:16 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d53c5000000b003333c2c313bsm46918wrw.100.2023.12.06.08.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 08:21:16 -0800 (PST)
Message-ID: <5baadfe9-089d-4802-8f9f-5ed49103710c@redhat.com>
Date: Wed, 6 Dec 2023 18:21:14 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/10] MAINTAINERS: Introduce V: entry for tests
Content-Language: en-US
To: Joe Perches <joe@perches.com>, workflows@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong"
 <djwong@kernel.org>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-3-Nikolai.Kondrashov@redhat.com>
 <7181366346c744a544515f69b1c21d5dba6ab25a.camel@perches.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <7181366346c744a544515f69b1c21d5dba6ab25a.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/23 20:58, Joe Perches wrote:
> On Tue, 2023-12-05 at 20:02 +0200, Nikolai Kondrashov wrote:
>> Require the entry values to not contain the '@' character, so they could
>> be distinguished from emails (always) output by get_maintainer.pl.
> 
> Why is this useful?
> Why the need to distinguish?

This is because get_maintainer.pl seems to insist on *always* outputting 
emails. I guess that was its sole original purpose, and it stuck to it? It 
kinda makes sense to me, especially given the name of the script, but at the 
same time, as a consequence you can't query *only* the tests (or anything but 
emails, really).

Therefore we have to be able to somehow filter out the emails from the 
get_maintainer.pl output, to get only the tests. Email addresses *have* to 
have the '@' character (seems to be the only reliable thing about them :D), so 
naturally I chose that as the way to distinguish them from the tests.

It's ugly, but considering the get_maintainer.pl legacy, it's good enough.

I don't mind changing get_maintainer.pl, though, to stop it from outputting 
emails (e.g. given an option), if that works for everyone involved.

Nick

