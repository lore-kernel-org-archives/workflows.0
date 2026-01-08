Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA3A3803DB
	for <workflows@vger.kernel.org>; Thu,  8 Jan 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767872648; cv=none; b=ZFc34BAIJfS/m/gaZDIy4ouWJLXzsgaOvge9a/qg+XbAEpYBSUFxiXZ5LieAYd9QQFqdx+SWbkX660kTijSVWSrnbIigmsA0qBKaCz429fDa1DKWreDYgjjGqutOXr9O5GEKkw0o8GrCj1zO5kzkvxsncbj6jQN8aJQ/o3AiOAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767872648; c=relaxed/simple;
	bh=xrGR+hVbQqlFVi+oVhz/8flmRpK+x6YDEgVW+X8KGBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWJ7P4QDFrg45EszawyKWsJhSyO7vcVCAjV6RSCpevEsEbngQRpWv1KD0QXlYT/aBDh5rXfuHYptGzsHdu6F5mchixpzp54hTrT+YaUDCuVvjOFv5K4zxk0aOAS8CfwBPKoBB1wSfg6ur0vN1f7iCrbGebUMOvoPoQWg1b5vo3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhl6SVaV; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhl6SVaV"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-122008e73c7so40270c88.2
        for <workflows@vger.kernel.org>; Thu, 08 Jan 2026 03:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767872643; x=1768477443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrGR+hVbQqlFVi+oVhz/8flmRpK+x6YDEgVW+X8KGBA=;
        b=lhl6SVaV0eM/umGNEy8bkFjdWnr2AlRnJIplpR4wF4r1te5ZenYF5QVKdLhghrTgdQ
         WdaJziMZOegvP1RSPuxGOj01+N73rJlC9dPp1bFo25OXMxr+QZDq3vco+SMFI2RcsYBA
         nuFrk3ceV8Xxfa6OPCLLJA8ojC4qxaZLLnfHhumf9H7eecWMweqg1HIbY4J73zszOKTo
         HBUT0HiqPnpQ4aAF5n70Q0KfHcoYmzSPuYRptLhwEBkwgEkK4hxM4maKeTmUaaprD31W
         uZvBg9AXn9qk8XJET7/WXMgNJUX8VU6HPZox7zbraJ5o9XoWaKejixxMSvDTefCtW2Z8
         xuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767872643; x=1768477443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrGR+hVbQqlFVi+oVhz/8flmRpK+x6YDEgVW+X8KGBA=;
        b=ZvYbZr3W+xFPYP4K2Ra5P63why6Vi0lQNhf1c9FbbruWGV87j+T7wcKzGfcrA+VY2D
         QZM6w8Ne6qDRoSJewRjMRylV+JMqgDMHkJARGLftIIQyMyTuWlBYRP8i2nTOq/V6MUUR
         195eaNBIoCOMWllKhFjVPwem5OCkNVLnY6zvUhCNfmLGEG6dN7VyaSLn/hF8iyN6eFJY
         TWrDWRmxuEvjkX+nYzU2zEbyXdVlYsYp5yokTWVm9tj38uQXEUIBFhJrDpc0exOYFSj8
         ndQ+VdJWN7d/1XNwkEeYMwERWPyGMtKd70XGi2jTxrUphjreWmXgwJKn3i+cGy5dPfbb
         dBIA==
X-Forwarded-Encrypted: i=1; AJvYcCVrxcKiWMx4DEvhwzAP+HJSew2cYyhw2jnIC3qJHaLnCCMNU/3jvyzclM3Uj4Gnk7Hs0j/bw2JMrXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTJiutN7DWnRuisf/ePhtFQv2FnX5TnIftI7eTo6+rM9UtKiu
	IHeh0OlYry/SKaEAmQgjTj9OBCOOMYcM892ihmNAbnIlfPk9d3+eSRZ0vYp0omqq6No9K9yyw50
	qfWWeUwmQ3+T7htCgNPMkMQT22A7mbJM=
X-Gm-Gg: AY/fxX6pJmclvuyYW7TTamJkPfFC5Ks+g6K4MLl4DDbkV4RHSncHg+r9h/6HObumRFM
	e1fuJVG5M+vZbFq2SUHIJdDNzrGiZCwAm8Rl0Dd/8CDN3uMes7dQMMiVKfuUTtXuhLreN/l3f8S
	y0hwkSgutG7/T956eQgLHr6op2qtON32VOGtFG3REVs0A6EtsMTP49it8gQioKHS7OhcKndbrgD
	eCtnolvQjdTJVYxh+tDGPr9bJH+ymc0M5OaNoWR01QM7iiWpvY/wF3IOxeQNsVg2IxvrLlJTFis
	w6/XcaVAfkozoHU/5MkuBmbBcC9Juz1HAx7PwIGbUTq+zJcbO4HlsUKLkNfiYM2XhR3Db2B7TrD
	KsV5eiNmMnoPh
X-Google-Smtp-Source: AGHT+IGcKac8pMZKDwsN7xuSxYAyxgcvhsM6SPIjYlDaOewWATgxRpDucjk7Ps207GV5/FmCzkkyu0SHsvtEnJDfQrI=
X-Received: by 2002:a05:7300:2154:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b17d34ee36mr2839354eec.8.1767872643019; Thu, 08 Jan 2026
 03:44:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local> <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local> <695ef146d651b_4b7a1002a@dwillia2-mobl4.notmuch>
 <12d910d5-0937-4aba-976c-9872289d21a4@lucifer.local>
In-Reply-To: <12d910d5-0937-4aba-976c-9872289d21a4@lucifer.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 12:43:50 +0100
X-Gm-Features: AQt7F2rvxjAETKAD5srp3jzV_wjMxBVwOH5dnDfOEbg3clqbr6a0nzFAf6Kezqs
Message-ID: <CANiq72nmAw0sZZHJfSoHOZ5rXgoi7O4kETASp2F62XyALqZ8gA@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: dan.j.williams@intel.com, Dave Hansen <dave@sr71.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	NeilBrown <neilb@ownmail.net>, "Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 11:29=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> I really don't think it is the case that maintainers can simplly dismiss =
an
> entire series like that.

I think Dan was referring to all kinds of series, i.e. maintainers
have leeway to reject proposals, whether they are big or small and
whether they are new features or cleanups.

After all, the project works by trusting maintainers to do the right
thing (i.e. the best they can with the information and time at their
disposal), but sometimes there may not be concrete technical reasons.

For instance, sometimes it is just a matter of bandwidth -- if
maintainers cannot maintain the code, and no one (that is trusted to
some degree) is willing to do so, then it would be a bad idea to take
the code anyway, even if the feature is great, whether LLM-generated
or not.

That is also why it is often said that it is a good idea to contact
maintainers/community before developing completely a new feature etc.
etc.

So if a subsystem suddenly starts to get an onslaught of series like
you warn about, then they cannot be expected to review and give
technical feedback to everything, and they will need to prioritize
somehow (e.g. fixes), or try to get more maintainers, or raise the
issue in ksummit, etc.

At least, that is my take, i.e. we need to allow maintainers to adjust
as things come. And, of course, as a community, we can always reassess
as conditions change.

Cheers,
Miguel
