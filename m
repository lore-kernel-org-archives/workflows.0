Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB33D3E8684
	for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073171; cv=pass; b=EIlTW4e0JDmGYjJkKRnBY/GuhdiqFWNfhGAFnxz7jGvTPzmu6TuQ7ITCvYnUobUGa3Txj1XIYYCSGmOXwoKEscWMubiljr2hW1lXZg0+R/pmohYbJuI8QurSRUvTgm4kmYHGz9II6DfLYbta7dPGxPkZqYLGKo1eDW7EvLBQSgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073171; c=relaxed/simple;
	bh=Ult2wbEPNmy3iN+NrU+/md6eFZJXKg3OExFz3pyUCCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXL+kbPYsVjaL6i/Uw4B9ODYkz+4lxPErI5Su9P6I6OK/Vs/Kof+TrjyW11omegVlC+7Gjozz01tV20fydyxpwzBvchZazegAPQrubtyj5hCLMhYKO3kaXVGEoPcT4QoanPfFHL6xOuv5P/P5LpdeDGdVnVOzCBzbsRJmQRDbmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGTJx7r+; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGTJx7r+"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-355724d032fso604929eec.3
        for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 07:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073170; cv=none;
        d=google.com; s=arc-20260327;
        b=ryiU+hPp/gvwC6EuM7BAGcEhwR4wnc4R/Z9p1aXvjOrq7MyvYlfD9IKw1f/sdrG3T5
         n1E92Vjdzxxo163d+JgkOPslwdsERlG7n2fv1bHwt3Kij8+LvP8J2ZG/M4JgK5xynP2Y
         Cd20Heij5bFHjXF05ykSC8KnSJ+AOpzrxkN3Q/MaXBzI6xrSYeAq/1M0QVZm8/PM/y8y
         SiL3+g8h7GTvb4oCjkDiWKAtHFvG4Qm5UGZBpZuqPKsUu+SV04E0PExJI1h5gQpXnacb
         d79jNoCIq6yRbG1+CKQgeP3fZ9t/LWay2yItFnYwApJM7CaRX9VEZ29RZT/NCdpbJgl2
         L28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P2P5MXeugorL2l1zb5x+FuUUdQZHK5/NjbEjCV7Jqx8=;
        fh=2DjebizF8Tf3KaWjCFAjFgvHltIIuBFBP+DWuaWYwe8=;
        b=s72ykKXzpgZO/ovqnDWgvWoLPre76FravZu7A1/HfRY4FESVmw6VnS59tul1Q5D5bZ
         37JC8+0x2ri6IBfO8jU5ZUgymIrWmY5uhvz8RS61DDn0iHKRLbTYX9VUGHem5GBi3DnW
         T+VLbO8vlvy0z5oVgDKArj2pisBg1qgx0DGAHRLjNlrslM/HcXMg7Ik+nZhZYpX4WTYH
         IyGZfBm+1BxdE0TOyiOC8Oy/dy6/KvAgb2Q5TWXNbHt6N6v0MW+JrIhSlikGvwlHgBcO
         sHQD4UhluSzEsYPZuhDRaF/9QYI0TTu6NO7I+WSotOeRnefro1eFal/aZ4/6Tja8RkH3
         dy1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073170; x=1792677970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P2P5MXeugorL2l1zb5x+FuUUdQZHK5/NjbEjCV7Jqx8=;
        b=sGTJx7r+Z/9MQgXtI+uX30PqChS/HjVj4TBPitiO6AGLwjxb4ZpboK2FMm8bfHrNWv
         ae/G/fiBt61LhUAWib9tvRvALWdKfIcn+1akZQV7d7sS3HP/QMm4ytNVQFpvs+DaWyWX
         8ionMm9eApSxnOMg3DY21jGWBrifL3DHZhhXbUGy3yuLlQnCQ6Rt6oXy9ugFXmyRlQXp
         Ow2lFgCd8it8ms4RcNlbyL3XKjgmRPdyhPA0KtIKUKSBQuB6ijQDRMdahBZpTk3sQW3H
         1rEPjZU3wEe/Rd6U5tZIO8p5bGwBGcTvb628/MGlXV1ppir/dmfiezui6FiW1IkHoWCU
         nIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073170; x=1792677970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2P5MXeugorL2l1zb5x+FuUUdQZHK5/NjbEjCV7Jqx8=;
        b=Oikms5OIpjtXXiXCEd0fh2zYI2942FHDYHQVIlA8Wx1N29Ato9ETksjesIy80uCXps
         if7tqIVm3dSfVdka3YfzS6UgS3b/7kHewAkllge+R+NOpHqQGOmh38qy+VRbwzyCGWR6
         Jah3KJLzyzGMgH3Y7SugZPP6089kJhNYyz7J7cd8cUWMyzrNocNdS5tY7ENcdUS0+8EA
         CiCsscl6HFpMXEzjVUstDnSTXBZn9MKloT8ZHOP9u/OYGPJ2RubsxgbriviX5xHibmmB
         83vQQgSM/kJujRoqk2XyN+bxyBtli/mCBkXiL/cjxtoKGXXHr9iatASgRj1JG5SCmPo2
         ZBZw==
X-Forwarded-Encrypted: i=1; AKwUvByCgzl2l5OlinYmJLmy9J6vLoiTk5NQTuQftOos1j2LkQgUarANgI5hYI49hzFMmSkunxdXCLB36sQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGLgF4//6LvmCGlDnv0BrOQWt2/MkGuhqwuy1z6L2eNcR+3ky4
	AF0bn9TTxlBDsGNjYRS3k74s3uQH/OOunWzF9+v7wPDdhWllBt0n9hvh2IVOO/ew2k4kx8PQjc1
	aP7OttIfjyxXSac1oAG5B8AYDyQKQTOg=
X-Gm-Gg: AYBFou0Rbc62byBbX7BXGyZpoosA6nTUBMmCh4poGyFm0ymAPcyTUNCzA0Hymw9PpA2
	Q5aWtTIsFfvCmNc+rnGexRY3fXYUhTmRFG7OvRHs41h53zLx9O7jVH9YQRud65HiC8LbxHMQclG
	vx1OrVP/aLL3kPgaiAjEJVzaBXZL7DvYTXgPj+DU3+9d5Utt5b2BH+NTJem1VFFT4IHm3oHYxQ5
	/9/vxno7+7fmN4QhWDDWlO4E7+5r1dCCP7Kh20mpQwhUYLLpfulo4hbp10RNCR5/9EEESTWK9sz
	tFBihXaVGcXS8mACCDBa0bLgwqej4JQAaxYQ2mLNyRj7ftdxNSWDJ0XRsfMVml8Ykl+YCeQlI24
	XRfimVgFZL27pT8sVHugpzcqcTwtPD83PCbuTTCUr6FahG9tvu/AY7qHDGS5Lv+KKD0e7wPZJ6Z
	RVqzlh/53c95kOIfYqkczcgXmQnZlEfnPd0KYjwm8AtC/+c/6ODAs=
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr38177586eec.0.1792073169449; Thu, 15 Oct 2026
 07:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps> <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
 <87jynjrrqo.fsf@trenco.lwn.net>
In-Reply-To: <87jynjrrqo.fsf@trenco.lwn.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 16:05:56 +0200
X-Gm-Features: AclHuK_RBJcp0X4oQoi_VtfEgbv-ao9LCjdidR0Z2ASFU3BEFBe0eg2AJEUSzpQ
Message-ID: <CANiq72=raWNCedXQW9dSDwxQTE0hfs9ecyGChRPnWqO6DUvbOw@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:57=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> For all that we hear about how smart these tools are, are they really
> incapable of dealing with two only slightly different markup formats?  I
> would really hate to bring in a separate format for this stuff...

I think it would work fine in practice. But it means that we have to
split every "skill" into two files (and reformat when we may want to
move details from one to the other), unless I am missing something.

So if we keep the files rendered and so on (possibly in
`Documentation/`), and make use of `.rst` features etc., then I think
it is worth doing it. If not, i.e. if we just use it as a place to
"dump text", then I think Markdown may be simpler.

Cheers,
Miguel
