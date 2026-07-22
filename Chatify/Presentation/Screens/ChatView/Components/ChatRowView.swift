//
//  ChatRowView.swift
//  Chatify
//
//  Created by AVINASH on 22/07/26.
//

import SwiftUI

struct ChatRowView: View {

    let conversation: Conversation

    var body: some View {

        HStack(alignment: .top, spacing: 12) {

            avatarView

            VStack(alignment: .leading, spacing: 6) {

                HStack(alignment: .top) {

                    Text(conversation.participantName)
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .lineLimit(1)

                    Spacer()

                    Text(formattedTime)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                HStack {

                    if conversation.isTyping {

                        Text("Typing...")
                            .font(.subheadline)
                            .foregroundStyle(.green)
                            .italic()

                    } else {

                        Text(conversation.lastMessage)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }

                    Spacer()

                    if conversation.unreadCount > 0 {

                        unreadBadge
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Private

private extension ChatRowView {

    var avatarView: some View {

        ZStack(alignment: .bottomTrailing) {

            Circle()
                .fill(Color.blue.opacity(0.15))
                .frame(width: 56, height: 56)
                .overlay {

                    Text(initials)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                }

            if conversation.isOnline {

                Circle()
                    .fill(.green)
                    .frame(width: 14, height: 14)
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 2)
                    }
            }
        }
    }

    var unreadBadge: some View {

        Text("\(conversation.unreadCount)")
            .font(.caption2)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .frame(minWidth: 20, minHeight: 20)
            .padding(.horizontal, 4)
            .background(.blue)
            .clipShape(Capsule())
    }

    var initials: String {

        let parts = conversation.participantName.split(separator: " ")

        if parts.count >= 2 {
            return "\(parts[0].first ?? Character(""))\(parts[1].first ?? Character(""))"
                .uppercased()
        }

        return String(conversation.participantName.prefix(1)).uppercased()
    }

    var formattedTime: String {

        conversation.lastMessageTime.formatted(
            date: .omitted,
            time: .shortened
        )
    }
}

#Preview {

    NavigationStack {

        List {

            ForEach(MockConversationProvider.conversations()) { conversation in

                ChatRowView(
                    conversation: conversation
                )
            }
        }
        .listStyle(.plain)
        .navigationTitle("Chats")
    }
}
