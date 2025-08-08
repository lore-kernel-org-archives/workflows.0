Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF319DF66
	for <workflows@vger.kernel.org>; Fri,  8 Aug 2025 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754676456; cv=none; b=P0PhNac1CNm5Ywb7DapZQJxlVv4r/fQG0ISLBq90TgVrJ3kzW7cN42SI+B9Yvf70tB29p0zYPd+LvLy86dJcdQNx1dESmoVvVyYgCQjJA+O8PYRshsR5PI4u3NDH7hmMsYC/zKxnjf8F6gEWLe6Kxtdhs1TbzTUtTIwDUk7M/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754676456; c=relaxed/simple;
	bh=y4aTgjecTMm7mWG9roqV7jvtYXxn0wcHUtjjq5zztQk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gs9QGpak95PS9FhnW8NCfeOMUIFHQnVnVStGnyTvZpltO8h6fgV40TEU0VrCnquYhWzJ4nDJ4c1dGTmVPLIuMD0EdO8BwpMJEWM0m4LA8VZLEo6Zqk+irtc1CiTtvLLn19fIFXRrE7qasfcwq4TF3hq1dXjY6SSao8c7NsHX1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-23c8f179e1bso33718845ad.1
        for <workflows@vger.kernel.org>; Fri, 08 Aug 2025 11:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754676454; x=1755281254;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdZE+LrZ1Dtr2wN/ldnaGqQLq+Kia3E7wlZDmnHjMTY=;
        b=l3ivgrdPTHq+Ph9guyu1rBjYo4pWjIMcN8YOPw/RJ4FPOXWzdcO8El+eXryGR+wKkW
         p9Bp/zrlezS+ueJCsCnpJZQN0ozk9RQ57gW9yCpjwpOHZmuQrmzNm3cWoehxVwfCM/jo
         lZNMncsz69f3KWGAu2+Zw9QUW4Pq6qAvQ8kleukhc9YwU7e2napnQZcetl0lMx7qqPH+
         LIX2UfWXloCYOJSQF+GEBrQ19F75LkeTU2psl5DeDcZa8BB/b3bCEmIsjHewmUqSuyfI
         nTJ9Omkj5aEEUcaj6zg257nF0c7A2zPLFdTEuS6OQ4EkyJamXCQStuA+GcfFYM8H+Svr
         I9sw==
X-Forwarded-Encrypted: i=1; AJvYcCUfSCy1+Z0fuEGG/kSWHfHkivu3vhtMcS8tJM2AdnlxqCAC7T7taMSKGo1FtUVr/pzQUBM9KcBst6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzppw07Uu9SyY65Byt89DDQGOtMaumWILZc0XSkt7dWj4Psk+zL
	GjydO0dlTniz9ZhQpkqFXwLd/M7LgH6kQf0KsyP7mxpbnuwlSL3aS/JPkWHjV3qZQ/8=
X-Gm-Gg: ASbGncskcIUoQxmLHD6YZz/vdKi3sHW4Xkz51Xd9qsrTfhtZlroP6Fr8f4o2PG7cn2g
	zJwZZiavix3yqH6yZmNuYBfl1cNamN9Ni9YsxOXTHfvssYAcZb9W1OpyfOaT/d3vyhrim7PyfHi
	RhecHvKX6pJL/M2CSa/JIuRHlZS7cMVpRMPK3c3kxl5zfv45C9EjamULtmdwS/hCV5HqIwruhRf
	kJr0Gd7yWOdacs+NkKZ4zKX7qv2h10GxmZ9mxqNi4PygDyaNe7ppSh8aAqwyeWXwTag/tj9I5cL
	BX+y9wGjvVD4c13K8TnahxdZP/+qHrSSwv3tM25iT38yxbRv4Cp4C3VRjqq9rwGVbTk9541U10m
	X+Jaqeez2IOyXsBa55/Sc
X-Google-Smtp-Source: AGHT+IH35AlHh+s+M4//5c5YAnKFpceo2gtMQAaeMl/FUzycglSJE0ISmMUC/H0y13AQEA96RBISWw==
X-Received: by 2002:a17:902:d4c1:b0:234:e655:a632 with SMTP id d9443c01a7336-242c225f5edmr58470705ad.51.1754676453957;
        Fri, 08 Aug 2025 11:07:33 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef658esm216589265ad.3.2025.08.08.11.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 11:07:33 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org
Subject: Re: [PATCH 1/4] agents: add unified agent coding assistant
 configuration
In-Reply-To: <CAL_JsqJW206w1OiOZ+4nMg7XyHQq7QnOyTWM0W+DyMmu-gpAjw@mail.gmail.com>
References: <20250727195802.2222764-1-sashal@kernel.org>
 <20250727195802.2222764-2-sashal@kernel.org> <7h1ppxcp0d.fsf@baylibre.com>
 <CAL_JsqJW206w1OiOZ+4nMg7XyHQq7QnOyTWM0W+DyMmu-gpAjw@mail.gmail.com>
Date: Fri, 08 Aug 2025 11:07:32 -0700
Message-ID: <7hwm7d661n.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> writes:

> On Wed, Jul 30, 2025 at 5:06=E2=80=AFPM Kevin Hilman <khilman@kernel.org>=
 wrote:
>>
>> Sasha Levin <sashal@kernel.org> writes:
>>
>> > Create a single source of truth for agent instructions in
>> > Documentation/AI/main.md with symlinks for all major coding
>> > agents:
>> > - CLAUDE.md (Claude Code)
>> > - .github/copilot-instructions.md (GitHub Copilot)
>> > - .cursorrules (Cursor)
>> > - .codeium/instructions.md (Codeium)
>> > - .continue/context.md (Continue)
>> > - .windsurfrules (Windsurf)
>> > - .aider.conf.yml (Aider)
>>
>> This doesn't work for aider, probably because the .md it links to is not
>> YAML.  When I start aider with this, I get:
>>
>>   aider: error: Couldn't parse config file: while scanning a simple key
>>     in "/work/kernel/linux/.aider.conf.yml", line 3, column 1
>>   could not find expected ':'
>>     in "/work/kernel/linux/.aider.conf.yml", line 4, column 1
>>
>> Not related to this series, but related to aider... I'm curious if
>> anyone has got aider to work with the kernel repo.  It seems to have
>> problems with large repos.  When starting in the kernel, I get:
>>
>>   Unable to list files in git repo: cannot close exported pointers exist
>>   Is your git repo corrupted?
>>   Unable to read git repository, it may be corrupt?
>>   cannot close exported pointers exist
>>
>> but neither claude nor gemini-cli have any problems with the same repo.
>>
>> The aider FAQ[1] mentions using .aiderignore to ignore parts of the
>> repo, but even with an "ignore everything" rule, I get the same error,
>> so something seems wrong with aider and large repos.
>
> It worked for a bit for me, but then aider fell over after a while and
> refused to run with errors accessing git. Some suggestions to repack
> the repo didn't help. In the end, I just ran it without any git
> awareness.

Do you mean just using the --no-git option to aider?

Kevin
