Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978208;
	b=kgGfvPmv8s8UHIJgQfVRW8G9WePHhHmMllSQ/WKw9IGmHpmkbp2hSfWnZ5D9jExXtWPL
	 jlY8ktkjL5ACuMj7QihZO9LaAscStReRttw+YzJDhfUisfoQuyIz0rYOiTsunFLXWzHw0
	 //Id2sBoheR5WIZy3ZrJTDIqnp4F6ycGGH0ehr7MgOV7byzrUpKVqNrn7Wbwcnmv5OH16
	 F0SO6JRtwDgCnnqdE8dD7Vz5JAWgND+JfQQfzYRqL2PNZSw9O8L066o7IRIBwRhQmLlIy
	 /zENE11n4ZPBXPbg9s9mOvWH56LI2+IK7fbgwZy7AZ0qLoRdv27dlesZy7AuXOclejQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
	b=AEDSsR12LQpNL1GuONg0PMcXNQ2CMPf7y5GSmm1AoHrt6TBRdc9quwAkONJq90+qgH2i
	 pFKTzNWbU6KjIrIZ1jz1MgToeI7tzKjz848S77tTG1Eaj0XPt/FpDZ1LdcMCnAAGTb9WO
	 hujT9cWrm8iVu3OQkbl1s0AmrmosWi8MCmLAn8LFdzkXxArw5Iouv7616g2PJkqz7tRrG
	 zTbFfJKOvc7ul88BaYNAABEFcS43YzHhWv5tTtllobom0NyAtokj82VZ1ivi2tHa8AJIr
	 5t2tSU6oj1smB4Ivu8OnARxI/YfPlYCqFT1KG/nI3QNrG5xFVIT5HIS4pSkWQyBMlig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=db06y5rc;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78B6606A322
	for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 01:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78B6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=db06y5rc
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5366ae57896so26965581cf.3
        for <workflows@vger.kernel.org>; Sun, 25 Oct 2026 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978207; x=1793583007; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
        b=db06y5rc/a42Q7I6gZJqHn+6RdhZMkCe/PM9bPSIkdzdKIQhT6awBXpLvTCqXMFoas
         vpdrgYSILQX6pa54FHjgkevhT0qw3vOv7aSYEbQ9kISBjZHIWOApblEsWdkQmN6fLDCk
         W24B5RsU3rGvAf0IivQNlEx9/t6cNsuLl8yuZxDFKTzIMJoEtBNayYZmAA82jEd8Qd07
         WLcOpzJBZ1ttIyv9gx4mwMIdcqToXkb+C1ma90FuzfTAC2kL+RjBEThxU4bAZuzQSInS
         TiQlkuu+Cs+eQO0ocaFK76BeQh/XfL0G6SA9Seh5Cl/7aXXbcPfIvztM8BV9n58h/Na5
         xQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978207; x=1793583007;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
        b=I/xcfX1uBE6BJ8jKmcnBAhAzotO3h17PvH9pzE7za+kVpWc9lsgzB808NcsYqfuaU9
         W3GP9yMsMyuSsv+j0Ss+bdgHGao++7ODLMfp7ic21cVLS4z/R+3ywk6e2tanNW8oSGKg
         c+sjcaQDdJ8ihIC/A7wJDrdNUkx6INtxuWKYuo0O+fW7epFP84KkGpChFIKsqQN+7O5z
         4FixtUPi2Mlb5Vvf5e0l2CLhGSeqtsxn+IzFXD8qtr85Yd4wqhv0mNDe68AFenfiBTvI
         Fey9qaU2d17XbIUW/UEPw8K59XDuiLW8hCLT8P3esHW+fampnGfo1e5ZZF4cqq6TTJxI
         KW4w==
X-Forwarded-Encrypted: i=1; AKwUvBx+yUxOnOETaRztRrX2Iob0+RangleYYyv1ft0rLgt6el3GhYtFyEiYrflYEYkxVpRTbDMk7Ap4sC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMjfiQjwGmUp6mnxCzd4pRDbpDbTcnjRKRwSVCspRNb0zZoKVx
	cO9m5uU+xH5HA565ULEPOx73E5UKJlJurvUj9coSgD0oBm5DS5Q5DRc=
X-Gm-Gg: AYBFou0fZvrNvJ718FZyYLIx7cjG3Rj3HehAJVORhZCaSBK8P8+41pT8K8UUMfUtJvR
	mnUiNfpDEX+SvsJYI/3oX4P8ioNWhPmo2KL2oCnvUHBSLSfdj3wjZFzObYgAQKcpDgUHBXSDR2l
	pHJwyGHhwaKisDEG90iUI+Jgh4VL91rdJsfO4Xehagjl2GWWqyPWmHPMbaEyiZMVYMp+lerNO4I
	zkT6KPOweD86SJvxjQUdW4Kqb0Ya8pv9TIC7+d29WThfyiAplEadGAIW6G5HQamSw7yLkXuH2I9
	BChL7OwcqCWjm7pgkkdL8rKP5f3ElXJopltxZIgpjWYnDhZxcIIkk6vZmDEOOL8QD7pGESk0Mae
	KjCnLsirfzAa6LqvwkvQAzsumUMEhQTBJC01rw6iV+BXUGXwpvRU3X5dFtZ1CDqZpkwZGGynoIR
	RzkmpJte6VgwC+BmdQBC6z0AZeU9e6XfUewMQtj3QNaxKHuJAhpRIKdhls7Hp3n8RPbCYfC90KY
	VQIxYBlnqOYHb3DwFq0xAmDfkZUPgO7YvbAgfRi/tv6cE1sliKbuTslNV60T1To8x7kPmUCLHvr
	cy9Mm3QqByd3c+yhGtGw3qVigQO83X53IJ52ZF41uLEXrzQ968eiRxDoGsJ0/SFqLGRTxmSR1cl
	JlfqRrP9CNVMcc3s87d4+xoYm3H1UM92SHeIoo7xekw==
X-Received: by 2002:a05:622a:5c6:b0:536:5c86:cfd8 with SMTP id d75a77b69052e-5383b5e681amr81425591cf.12.1792978206784;
        Sun, 25 Oct 2026 18:30:06 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970a2basm44270051cf.18.2026.10.25.18.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:30:03 -0700 (PDT)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: danielmaraboo@gmail.com
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kunit: document --summary and --failed options
In-Reply-To: <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com> <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
Date: Mon, 26 Oct 2026 01:30:03 -0000
Message-ID: <179297820301.2598507.8486986636667612321@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Daniel,

Thanks for checking the entries against kunit.py and kunit_parser.py.

On the indentation: the continuation lines in the patch as sent use two
spaces, matching the --json and --junit items (see the raw message on
lore). It may have lost a space on the way to your tree, but please let
me know if you still see the warnings with the original.

On Assisted-by: thanks, I had missed that docs-next dropped it. v2
follows in reply, with the tool use described in the changelog instead.

Thanks,
Eugenio (Jay)
